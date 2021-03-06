<div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">创建文章</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form method="post" role="form" id="create_form">
              <div class="box-body">
               
                <div class="form-group">
                  <label for="content">内容</label>
                  <textarea id="content"  placeholder="Enter ..." rows="3" class="form-control"></textarea>
                </div>
                 
              
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <input type="hidden" name="type" value="{{.type}}">
                <button class="btn btn-primary" id="create">Submit</button>
              </div>
            </form>
          </div>

<!-- CK Editor -->
<script src="/static/plugin/bower_components/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function(){

		$("form").submit(function(){
			var form = document.getElementById("create_form");
			var fdata = new FormData(form);
			fdata.append("content",CKEDITOR.instances.content.getData());
			
			if($.trim(fdata.get("content"))=="") {
				prompt("文章内容为必填不能为空");
				return false;
			}
						
			$.ajax({
				url:"/article/create",
				type:"post",
				data:fdata,
				processData: false,
				contentType: false,
				dataType: "json",
				cache: false,
				success:function(e){
					if (e.code<0) {
						prompt(e.msg);
						return false;
					}

					greeting({
						msg:"创建成功",
						confirm: function(){
							location.href = "/article/list?type=3";
						},
					})
				},
			});
			return false;
		});

		CKEDITOR.replace('content',{
			filebrowserImageUploadUrl:"/ckuploadfile",
			image_previewText:" ",
		})

	});	
</script>