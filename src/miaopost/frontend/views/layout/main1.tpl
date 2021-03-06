<!DOCTYPE HTML>
<html>
        <head>
            {{template "layout/base-style.tpl" .}}
         </head>
         <body>
                <div class="container">
                        <div class="page-header row">
                                <div class="logo col-md-2">
                                       <a href="/">秒Po</a> <span>极简校园信息发布平台</span>
                                </div>
                                <div class="slogan col-md-10">
                                    <div class="row">
                                        <div class="col-md-5">
                                            <div class="input-group">
                                              <input type="text" class="form-control" id="search" placeholder="搜索, eg. 室友，moving">
                                              <span class="input-group-btn">
                                                <button class="btn btn-default search-btn" type="button"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
                                              </span>
                                            </div>
                                        </div>
                                        <div class="col-md-5 cats">
                                            {{range .cats}}
                                                <a href="/info/list?cid={{.Id}}" class="search_cats {{if eq .Id $.cid}}label label-primary{{end}}">{{.Name}}</a> 
                                            {{end}}
                                        </div>
                                        <div class="col-md-2">
                                            <div class="dropdown">
                                                  <button class="btn btn-primary dropdown-toggle" type="button" id="publish-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
                                                    发布    
                                                    <span class="caret"></span>
                                                  </button>
                                                  <ul class="dropdown-menu" aria-labelledby="publish-btn">
                                                    {{range .cats}}
                                                     <li><a href="/info/create?cid={{.Id}}">{{.Name}}</a></li>
                                                    {{end}}
                                                  </ul>
                                            </div>
                                            <!--<a href="/info/create" class="btn btn-primary active" role="button">发布</a>-->
                                        </div>
                                    </div>
                                </div>
                        </div>
                        <div class="content row">
                            <div class="col-md-9">{{.LayoutContent}}</div>
                             <div class="col-md-3">{{template "layout/side.tpl" .}}</div>   
                        </div>
                </div>

                {{template "layout/footer.tpl" .}}
                {{template "layout/base-script.tpl" .}}
                {{if .isWeixin}}
                {{template "layout/wxshare.tpl" .}}
                {{end}}
         </body>
</html>