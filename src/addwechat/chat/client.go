package chat

import (
	"fmt"
	"golang.org/x/net/websocket"
	"io"
	"time"
	"yhl/help"
)

const channelBufSize int = 100

type Client struct {
	id        int
	gid       int
	ws        *websocket.Conn
	server    *Server
	msgCh     chan *Message
	doneMsgCh chan bool
	follow    []int
}

func NewClient(ws *websocket.Conn, server *Server) *Client {
	if ws == nil {
		panic("ws cannot be nil")
	}

	if server == nil {
		panic("server cannot be nil")
	}

	msg := make(chan *Message, channelBufSize)
	doneMsg := make(chan bool)

	return &Client{0, 0, ws, server, msg, doneMsg, []int{}}
}

func (c *Client) Conn() *websocket.Conn {
	return c.ws
}

func (c *Client) Write(message *Message) {
	select {
	case c.msgCh <- message:
	default:
		c.server.Del(c)
		err := fmt.Errorf("client %d is disconneted.", c.id)
		c.server.Err(err)
	}
}

func (c *Client) Done() {
	c.doneMsgCh <- true
}

func (c *Client) Listen() {
	go c.listenWrite()
	c.listenRead()
}

func (c *Client) listenWrite() {
	for {
		select {
		case message := <-c.msgCh:
			websocket.JSON.Send(c.ws, message)
		case <-c.doneMsgCh:
			c.server.Del(c)
			c.doneMsgCh <- true
			return
		}
	}
}

func (c *Client) listenRead() {
	for {
		select {
		case <-c.doneMsgCh:
			c.server.Del(c)
			c.doneMsgCh <- true
			return
		default:
			var msg Message
			err := websocket.JSON.Receive(c.ws, &msg)

			if err == io.EOF {
				c.doneMsgCh <- true
			} else if err != nil {
				c.server.Err(err)
			} else {
				msg.CreateTime = time.Now().Format(help.DatetimeFormat)
				go func(msg Message) {
					help.MongoDb.C("messages").Insert(&msg)
					fmt.Println(msg)
				}(msg)

				if msg.Type == "login" {
					c.id = msg.Uid
					c.gid = msg.Gid
					c.follow = msg.Follow
					c.server.Add(c)
				} else if msg.Type == "message" {
					c.server.SendAll(&msg)
				}

			}
		}
	}
}
