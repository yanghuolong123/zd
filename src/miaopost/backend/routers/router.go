package routers

import (
	"github.com/astaxie/beego"
	"miaopost/backend/controllers"
)

func init() {
	//beego.Router("/", &controllers.MainController{})
	beego.Router("/", &controllers.SiteController{})
	beego.Router("/login", &controllers.SiteController{}, "get:LoginGet")
	beego.Router("/login", &controllers.SiteController{}, "post:LoginPost")
	beego.Router("/logout", &controllers.SiteController{}, "*:Logout")

	beego.Router("/article/list", &controllers.ArticleController{}, "*:List")
	beego.Router("/article/create", &controllers.ArticleController{}, "*:Create")
	beego.Router("/article/edit", &controllers.ArticleController{}, "*:Edit")
	beego.Router("/article/delete", &controllers.ArticleController{}, "*:Delete")

}
