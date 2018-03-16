<div class="create">
        <form class="form-horizontal">
            <div class="form-group">            
              <div class="col-sm-offset-1 col-sm-4">
                <select id="cid" class="form-control">
                  <option value="">请选择分类</option>
                  {{range .cats}}
                    <option value="{{.Id}}" {{if  eq .Id  $.info.Cid}}selected{{end}}>{{.Name}}</option>
                  {{end}}
                </select>
              </div>
            </div>          
            <div class="form-group">             
              <div class="col-sm-offset-1 col-sm-6">
                <label>图片和文字可以只填一项</label>
                <textarea class="form-control"  id="info_content" rows="3" maxlength="2500" placeholder="添加描述">{{.info.Content}}</textarea>
                <div class="img-up">
                    <div class="img-up-list clearfix">                        
                      {{range .photos}}
                        <div class="img-li img-li-new" data-url="{{.Url}}"  data-big="' + upImg + '" style="background-image:url({{.Url}})"><i></i></div>
                      {{end}}
                    </div>
                    <label class="user-img" for="imgs"><input type="file" name="imgs" id="imgs"></label>
                </div>
              </div>
            </div>
            <div class="form-group">            
              <div class=" col-sm-offset-1 col-sm-2">
                <label>自动删除发布</label>
                <div class="row">
                  <div  class="col-md-8">
                  <input type="text" class="form-control"  id="valid_day" value="{{.info.Valid_day}}" maxlength="10" placeholder=""> 
                  </div>
                  <div class="col-md-4 valid_date">
                    <span class="">天后</span>
                  </div>
                </div>
              </div>
            </div>
             <div class="form-group">            
              <div class=" col-sm-offset-1 col-sm-4">
                <label>我们会发送编辑链接至邮箱</label>
                <input type="text" class="form-control" id="email" value="{{.info.Email}}" maxlength="55" placeholder="邮箱地址">
              </div>
            </div>                  
            <div class="form-group">
                  <div class="col-sm-offset-1 col-sm-5  error_tips text-danger"></div>
            </div>
            <div class="form-group">
              <div class="col-sm-offset-1 col-sm-10">
                <input type="hidden" id="info_id"  value="{{.info.Id}}" name="id">
                <button type="button" id="edit_info_btn" class="btn btn-success btn-lg">发布</button>
              </div>
            </div>
          </form>
</div>
