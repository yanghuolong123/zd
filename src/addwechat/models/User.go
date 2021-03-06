package models

import (
	"errors"
	"github.com/astaxie/beego/orm"
	"time"
	"yhl/help"
)

func init() {
	orm.RegisterModelWithPrefix("tbl_", new(User))
}

type User struct {
	Id         int
	Gid        int
	Openid     string
	Username   string
	Email      string
	Password   string
	Nickname   string
	Mobile     string
	Avatar     string
	Level      int
	Status     int
	Createtime time.Time
}

func GetUserById(id int) (user *User, err error) {
	o := orm.NewOrm()
	user = &User{Id: id}
	err = o.Read(user)

	return
}

func GetUserByOpenid(openid string) (user *User, err error) {
	o := orm.NewOrm()
	user = &User{Openid: openid}
	err = o.Read(user, "Openid")

	return
}

func GetUserByUsername(username string) (user *User, err error) {
	user = &User{Username: username}
	err = orm.NewOrm().Read(user)

	return
}

func Login(username, password string) (*User, error) {
	password = help.Md5(password)

	o := orm.NewOrm()
	user := new(User)
	user.Username = username
	user.Password = password
	err := o.Read(user, "username", "password")
	if err != nil {
		return nil, errors.New("帐号或密码有误！")
	}

	return user, nil
}

func CreateUser(user *User) int {
	user.Createtime = time.Now()
	i, _ := orm.NewOrm().Insert(user)

	return int(i)
}

func UpdateUser(user *User) error {
	_, err := orm.NewOrm().Update(user)

	return err
}
