<%@page import="com.ac.travel.bean.GalleryVideoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%GalleryVideoBean galleryvideobean=(GalleryVideoBean)request.getAttribute("gb"); %>	

<%@include file="allcss.jsp"%>	
<title>Travel Gallery Video|<%if(galleryvideobean==null){%>Add Gallery Video<%}else{ %>Edit Gallery Video<%}%></title>

<%@include file="allcss.jsp"%>

</head>
<body>
<%@include file="adminleftmenu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li><a href="galleryVideo?gact=manageGalleryVideo">
				List Gallery Video</li></a>
				<%if(galleryvideobean == null){ %>
				<li class="active">Add Gallery Video</li>
				<%}else{ %>
				<li class="active">Edit Gallery Video</li>
				<%} %>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			<%if(galleryvideobean == null){ %>
				<h1 class="page-header">Add Gallery Video</h1>
				<%}else{ %>
				<h1 class="page-header">Edit Gallery Video</h1>
				<%} %>
				
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<%if(galleryvideobean == null){ %>
				<div class="panel-heading">Add Gallery Video</div>
				<%}else{ %>
				<div class="panel-heading">Edit Gallery Video</div>
				<%} %>
					<div class="panel-body">
						<div class="col-md-8">
					
							<form role="form" action="galleryVideo?action=addGalleryVideo" id="form" method="post">
								<div class="form-group">
									<label>Gallery Name</label>
									<input class="form-control" name="galleryVideo_name" id="galleryVideo_name" placeholder="Gallery Name" value="<%=(galleryvideobean!=null)?galleryvideobean.getGalleryvideo_name():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Gallery Link</label>
									<input class="form-control" name="galleryVideo_link" id="galleryVideo_link" placeholder="Gallery Link" value="<%=(galleryvideobean!=null)?galleryvideobean.getGalleryVideo_link():""%>" required>
								</div>
										
								<div class="form-group" style="display: none;">
									<label>Gallery id</label>
									<input type="text" name="galleryvideo_id" value="<%=(galleryvideobean!=null)?galleryvideobean.getGalleryvideo_id():""%>" >
								</div>
									<button type="submit" class="btn btn-primary">Submit</button>
									<button type="reset" class="btn btn-default" onclick="restForm();">Reset</button>
								</div>
							</form>
						</div>
					</div>
						</div>
					</div>
	</div><!--/.main-->
<%@include file="alljs.jsp"%>	

   <script type="text/javascript">
   $(document).ready(function() {

	    $('#imageFile').change(function(evt) {

	        var files = evt.target.files;
	        var file = files[0];

	        if (file) {
	            var reader = new FileReader();
	            reader.onload = function(e) {
	                document.getElementById('preview').src = e.target.result;
	            };
	            reader.readAsDataURL(file);
	        }
	    });
	});

	function ResizeImage() {
	    if (window.File && window.FileReader && window.FileList && window.Blob) {
	        var filesToUploads = document.getElementById('imageFile').files;
	        var file = filesToUploads[0];
	        if (file) {
	            var reader = new FileReader();
	            // Set the image once loaded into file reader
	            reader.onload = function(e) {

	                var img = document.createElement("img");
	                img.src = e.target.result;

	                var canvas = document.createElement("canvas");
	                var ctx = canvas.getContext("2d");
	                ctx.drawImage(img, 0, 0);

	                var MAX_WIDTH = 360;
	                var MAX_HEIGHT = 240;
	                var width = img.width;
	                var height = img.height;

	                if (width > height) {
	                    if (width > MAX_WIDTH) {
	                        height *= MAX_WIDTH / width;
	                        width = MAX_WIDTH;
	                    }
	                } else {
	                    if (height > MAX_HEIGHT) {
	                        width *= MAX_HEIGHT / height;
	                        height = MAX_HEIGHT;
	                    }
	                }
	                canvas.width = width;
	                canvas.height = height;
	                var ctx = canvas.getContext("2d");
	                ctx.drawImage(img, 0, 0, width, height);

	                dataurl = canvas.toDataURL(file.type);
	                document.getElementById('output').src = dataurl;
	                document.getElementById("value").value=dataurl;
	            }
	            reader.readAsDataURL(file);

	        }

	    } else {
	        alert('The File APIs are not fully supported in this browser.');
	    }
	}
   </script>
   <script type="text/javascript">
   function imageValidate()
   {   
	var imageFile= document.getElementById("imageFile").value;   
	var value= document.getElementById("value").value;
	if(imageFile===""||imageFile===null)
	{
	    var msg ='<%=request.getAttribute("gallerybean")%>';
	    if (msg == "null") 
	    {
		alert("Please Choose Image File..")
		document.getElementById('imageFile').focus();
		return false
	    }
	    else
	    {
	    	if(imageFile=="")
	    	{
	    		
	    	}
	    	else
	    	{
	    		alert("Please Resize Image..")
	    		document.getElementById('resizeimg').focus();
	    		return false
	        }
	    }
	}
	else if(value===""||value===null)
	{
		alert("Please Resize Image..")
		document.getElementById('resizeimg').focus();
		return false
	}  
	function restForm()
	{
		alert("Are you sure you want to Reset Form?")
		document.getElementById("form").reset();
	}
	   
 } 
   </script>
</body>
</html>