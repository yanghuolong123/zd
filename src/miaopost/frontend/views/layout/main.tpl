<!DOCTYPE HTML>
<html>
        <head>
            {{template "layout/base-style.tpl" .}}
         </head>
         <body>
                <div class="container">
                        <div class="page-header row">
                                <div class="row ">
                                    <div class="col-md-12 region"> 
                                        <a href="javascript:;">UTD <span class="caret"></span></a>
                                        <p class="pull-right text-right">
                                            {{if .user}}
                                                <a  href="/user" class="">
                                                                  {{.user.Nickname}}
                                                </a>  
                                            {{else}}
                                                <a id="loginBtn"  href="javascript:;">
                                                          <span aria-hidden="true" class="glyphicon glyphicon-user"></span>
                                                </a>
                                            {{end}}
                                        </p>
                                    </div>                                    
                                </div>   
                        </div>
                         <div class="logo row">
                                       <a href="/">秒Po</a> <span>极简校园信息发布平台</span>
                        </div>
                        <div class="content row">
                            <div class="col-md-9">{{.LayoutContent}}</div>
                             <div class="col-md-3">{{template "layout/side.tpl" .}}</div>   
                        </div>
                </div>

                {{template "login/login.tpl" .}} 
                {{template "layout/footer.tpl" .}}
                {{template "layout/base-script.tpl" .}}
                {{if .isWeixin}}
                {{template "layout/wxshare.tpl" .}}
                {{end}}
         </body>
</html>