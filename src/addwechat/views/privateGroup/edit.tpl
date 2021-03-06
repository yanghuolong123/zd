<div class="create_pg">
	<div class="row title">
		<div class="col-md-offset-1 col-md-1">
			<h4 class="text-primary">发布群</h4>
		</div>
		<div class="col-md-6">
			<p class="text-muted">建立微信群人数不够，可以添加 <a tabindex="0" class="help_wx" role="button" data-placement="right" data-html="true" data-toggle="popover" data-trigger="focus" title="小助手微信" data-content="<span class='help_wx_qrcode'><img src='/static/images/Amy55299.jpg'/><img src='/static/images/Tom55299.jpg'/></span>">小助手微信</a> 凑够3人</p>
		</div>
	</div>
	<form class="form-horizontal">
	  <div class="form-group">
	    <label for="school" class="col-sm-2 control-label">应用范围</label>
	    <div class="col-sm-6">
	      <input type="hidden" name="pg_id" id="pg_id" value="{{.pg.Id}}">
	      <input type="hidden" name="gid" id="search_group" value="{{.pg.Gid}}">
	      <input type="text" class="form-control school" id="search"  maxlength="100" value="{{.group.En_name}}" placeholder="请输入学校关键字或简称，必填" data-provide="typeahead" autocomplete="off" disabled="disabled">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="name" class="col-sm-2 control-label">群名称</label>
	    <div class="col-sm-6">
	      <input type="text" class="form-control" id="name" maxlength="55" value="{{.pg.Name}}" placeholder="必填">
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="introduction" class="col-sm-2 control-label">补充介绍</label>
	    <div class="col-sm-6">	    
	      <textarea class="form-control"  id="introduction" rows="3" maxlength="200" placeholder="可补充群名称中未包含的信息、关键字等">{{.pg.Introduction}}</textarea>
	    </div>
	  </div>
	  <div class="form-group">
	    <label for="uploadfile" class="col-sm-4 control-label">上传联系信息 (以下三项至少填一项)</label>	   
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-7">	 
	    	<div class="row">
	    		{{if .pg.Qrcode}}
		      	<div class="uploadimg col-sm-2 active"  style="background-image: url('{{.pg.Qrcode}}');">
		      	{{else}}
		      	<div class="uploadimg col-sm-2">
		      	{{end}}
		      		<input type="hidden" value="{{.pg.Qrcode}}" name="qrcode" id="qrcode">	      
			    	<input type="file" name="qrcode_file" style="display: none" id="qrcode_file">
	                                       	<a role="button" href="javascript:;" class="upload_btns" onclick="uploadFile(this);return false;" id="file_qrcode_upload">{{if .pg.Qrcode}}{{else}}上传群二维码{{end}}</a>
		      	</div>
		      	{{if .pg.Ower_qrcode}}
		      	<div class="uploadimg col-sm-2 active"  style="background-image: url('{{.pg.Ower_qrcode}}');">
		      	{{else}}
		      	<div class="uploadimg col-sm-2">
		      	{{end}}
		      		<input type="hidden" value="{{.pg.Ower_qrcode}}" name="ower_qrcode" id="ower_qrcode">	      
			    	<input type="file" name="ower_qrcode_file" style="display: none" id="qrcode_file">
	                                       	<a role="button" href="javascript:;" class="upload_btns" onclick="uploadFile(this);return false;" id="file_ower_qrcode_upload">{{if .pg.Ower_qrcode}}{{else}}上传群主二维码{{end}}</a>	      	
		      	</div>
	      	</div>
	      	<div class="row">
	      		<label for="wechat_id" class="col-sm-2 control-label wechat_id_label">群主微信号</label>
	      		<div class="col-sm-4">
	      			<input type="text" class=" form-control" id="wechat_id" maxlength="50" value="{{.pg.Wechat_id}}" placeholder="">
	      		</div>	      		
	      	</div>
	    </div>
	  </div>	  
	  <div class="form-group">
	  	<div class="col-sm-offset-2 col-sm-5  error_tips text-danger"></div>
	  </div>
	  <div class="form-group">
	    <div class="col-sm-offset-2 col-sm-10">
	      <button type="button" id="edit_pg_btn" class="btn btn-success btn-lg">保存</button>
	    </div>
	  </div>
	</form>
</div>