<!DOCTYPE HTML>
<html>
	<head>
	    <title>Add Wechat-北美留学生微信群</title>
	    <meta charset="UTF-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
	    <link rel="stylesheet" type="text/css" href="/static/plugin/bootstrap/css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" href="/static/css/common.css">
	    <link rel="stylesheet" type="text/css" href="/static/css/addwechat.css">  
	 </head>
	 <body>
	 	<div class="container home">
	 		<div class="head">
	 			<div class="row">
	 				<div class="col-md-10">	 					
 						<div class="logo"><a href="/"><img src="/static/images/logo10.png" /></a></div>
 						<h3 class="title text-muted">北美留学生的微信群</h3>	 					
	 				</div>
	  				<div class="col-md-2 user">                                            
                                          {{if .user}}
                                            <input type="hidden" name="uid" id="uid" value="{{.user.Id}}">
                                            <a  href="/user" class="btn btn-info">
                                              <span class="glyphicon glyphicon-user" aria-hidden="true"></span>  {{.user.Nickname}}
                                            </a>                                            
                                          {{else}}
                                            <input type="hidden" name="uid" id="uid" value="0">
                                            <button type="button" class="btn btn-info" id="loginBtn">
                                              <span class="glyphicon glyphicon-log-in" aria-hidden="true"></span> 登录
                                            </button>
                                          {{end}}                                          
                                      </div>
	 			</div>
	 		</div>
	 		<div class="content">
	 			<div class="box1 row">
                           
                            <div class="col-md-6 form-group">
                              <input type="hidden" id="search_group" name="search_group" value="" />
                              <input type="text" id="search" class="form-control" placeholder="请输入学校关键字或简称" data-provide="typeahead" autocomplete="off" />
                            </div>
                            <div class="col-md-1 form-group">
                              <a href="/pg/create" id="publish_pg" class="btn btn-success" role="button">发布群</a>
                            </div>   
                                                    
                        </div>
	 			<div class="tips ">
                          <div class="alert alert-warning col-md-10" role="alert">
                            为了避免广告商无序加群和扰乱留言,每个账号只能解锁两所学校内的二维码。请大家登录->选校->解锁后再查看二维码详情、扫码和留言。<br>希望同学们能够谅解由此带来的不便。
                          </div>
                        </div>
	 			<div class="list row">
                              {{range .pgroups}}
  					<div class="col-sm-6 col-md-3">                              
    						<div class="thumbnail">
      							<a href="/pg/list?gid={{.Gid}}"><img src="/static/images/pgindex" alt="{{.Name}}"></a>
      							<div class="caption">
        							 <a href="/pg/list?gid={{.Gid}}"><h4>{{.Name}}</h4></a>
       							         <p class="text-muted">{{.Introduction}}</p>
      							</div>
    						</div>
  					</div>  					
  				      {{end}}
				</div>
	 		</div>	 	         
	 	</div>

            {{template "../login/login.tpl" .}}           
            
            <div id="modalPage">
              
            </div>
             <script src="/static/plugin/jquery/jquery-2.2.4.js"></script>
	     <script src="/static/plugin/bootstrap/js/bootstrap.min.js"></script>
             <script src="/static/plugin/bootstrap/js/bootstrap3-typeahead.min.js"></script>
             <script src="/static/js/common.js"></script>
            <script src="/static/js/addwechat.js"></script> 	
	 </body>
</html>
