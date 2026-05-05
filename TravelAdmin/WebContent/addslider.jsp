<!DOCTYPE html>
<%@page import="com.ac.travel.bean.SliderBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<%SliderBean sliderbean=(SliderBean)request.getAttribute("sb"); %>	

<%@include file="allcss.jsp"%>	
<title><%if(sliderbean==null){%> Add Slider<%}else{ %> Edit Slider<%}%> | Travel.</title>
	

<%@include file="allcss.jsp"%>


</head>
<body>
<%@include file="adminleftmenu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin?action=adminhome">
					<em class="fa fa-home"></em>
				</a></li>
				<li><a href="slider?action=listSlider">
				 List Slider</li></a>
				<%if(sliderbean == null){ %>
				<li class="active">Slider Photo</li>
				<%}else{ %>
				<li class="active">Edit Slider</li>
				<%} %>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			<%if(sliderbean == null){ %>
				<h1 class="page-header">Add Slider</h1>
				<%}else{ %>
				<h1 class="page-header">Edit Slider</h1>
				<%} %>
				
			</div>
		</div><!--/.row-->
		
				
		
		<div class="row">
			<div class="col-lg-12" style="width: 500%;">
				<div class="panel panel-default">
				<%if(sliderbean == null){ %>
				<div class="panel-heading">Add Slider</div>
				<%}else{ %>
				<div class="panel-heading">Edit Slider</div>
				<%} %>
					<div class="panel-body">
					<form role="form" action="slider" id="form" method="post" onsubmit="return imageValidate()">
						<div class="col-md-8">
									<div class="form-group">
										<label>Slider Name</label>
										<input type="text" class="form-control" name="slider_name" id="slider_name" placeholder="Slider Name" value="<%=(sliderbean!=null)?sliderbean.getSlider_name():""%>" required="required">
									</div>
									
									
									<div class="form-group">
									<label>Slider Photo</label>
									<p>Image Size 1920X800 </p>
				                    <input id="imageFile" name="imageFile" type="file" class="imageFile" accept="image/*"/> <br>
									<input type="button" value="Resize Image" id="resizeimg"  onclick="ResizeImage()"/> <br>
									<br/>
									<img src="" id="preview" style="display: none;" >
									<img src="" style="border: 1px solid #ccc;" name="url" id="output">
									<%if(sliderbean!=null){ %>
									<img src="fetchGallery?type=UserPhoto&image=<%=(sliderbean!=null)?sliderbean.getSlider_img():""%><%--    fetchGallery?type=UserPhoto&image=<%=(sliderbean.getSlider_img()!=null)?sliderbean.getSlider_img():""%> --%>" height="800" width="1920"/>
									<input type="hidden" name="edit_img_url" value="<%=(sliderbean!=null)?sliderbean.getSlider_img():""%>">
									<%} %>
									<input type="hidden" name="url" id="value">			
								</div>
										
								<div class="form-group" style="display: none;">
									<label>Slider Id</label>
									<input type="text" name="slider_id" value="<%=(sliderbean!=null)?sliderbean.getSlider_id():""%>" >
									
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

	                var MAX_WIDTH = 1175;
	                var MAX_HEIGHT = 505;
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
	    var msg ='<%=request.getAttribute("sliderbean")%>';
	    if (msg == null) 
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

