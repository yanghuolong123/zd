<div class="pg_list">
	<h4 class="title">{{.group.Name}}</h4>
	<div class="row">
	            <div class="col-md-6">
	              <input type="hidden" id="search_group" name="search_group" value="" />
	              <input type="text"  class="form-control" id="search" placeholder="请输入学校关键字或简称" data-provide="typeahead" autocomplete="off">
	            </div>
	            <div class="col-md-1">
	              <a href="/pg/create" class="btn btn-success" role="button">发布群</a>
	            </div>                            
	</div>
	<input type="hidden" id="gid" name="gid" value="{{.group.Id}}">
	{{if .pgs}}
	{{if .isunlock}}
	<button disabled="disabled" class="btn btn-warning unlock_group">已解锁</button>
	{{else}}
	<button id="unlock_group" class="btn btn-warning unlock_group">解锁</button>
	{{end}}
	<div class="list row">
                  	{{range .pgs}}
		<div class="col-xs-6 col-md-3">                              
			<div class="thumbnail">
					<a href="/pg/view?id={{.Id}}"><img src="/{{.Qrcode}}" alt="{{.Name}}"></a>
					<div class="caption">
					 <h4>{{.Name}}</h4>
					         <p class="text-muted">{{.Introduction}}</p>
					</div>
			</div>
		</div> 		
		 {{end}}
	</div>
	{{else}}
		<div class="alert alert-info" role="alert">
			<p>亲，还没有人发布群呢！</p>
		</div>
	{{end}}
</div>