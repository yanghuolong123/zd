package controllers

import (
	"encoding/json"
	"miaopost/frontend/models"
	"strconv"
	"time"
	"yhl/help"
	"yhl/wechat"
)

type LoginController struct {
	help.BaseController
}

func (this *LoginController) LoginGet() {
	sceneId := "login_" + time.Now().Format(help.DatetimeNumFormat) + strconv.Itoa(help.RandNum(10000, 99999))
	qrImgUrl := wechat.GetTmpStrQrImg(sceneId)

	this.Data["qrImgUrl"] = qrImgUrl
	this.Data["sceneId"] = sceneId
	this.TplName = "login/index.tpl"
	s, _ := this.RenderString()

	this.SendRes(0, "success", s)
}

func (this *LoginController) LoginPost() {
	sceneId := this.GetString("sceneId")
	cache := help.Cache
	c := cache.Get(sceneId)
	if c != nil {
		u := new(models.User)
		json.Unmarshal([]byte(c.([]uint8)), u)
		this.SetSession("user", u)
		this.SendRes(0, "success", nil)
	}

	this.SendRes(-1, "failed", nil)
}

func (this *LoginController) Logout() {
	this.DelSession("user")

	this.Redirect("/", 302)
}

func (this *LoginController) LoginByKey() {
	key := this.GetString("key")
	cache := help.Cache
	c := cache.Get(key)
	if c != nil {
		u := models.User{}
		json.Unmarshal([]byte(c.([]uint8)), &u)
		this.SetSession("user", u)

		this.Redirect("/", 302)
		return
	}

	this.Redirect("/tips?msg=链接已失效", 302)
}
