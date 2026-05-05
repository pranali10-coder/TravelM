<%@page import="com.ac.travel.bean.GalleryBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<%GalleryBean gallerybean=(GalleryBean)request.getAttribute("gb"); %>	

<%@include file="allcss.jsp"%>	
<title>Travel Gallery  |<%if(gallerybean==null){%>Add Gallery<%}else{ %>Edit Gallery<%}%></title>

<%@include file="allcss.jsp"%>
	<style type="text/css">
	.overlay 
	{
		position: absolute;
		left:  40% ;
		top: 29% /* 40% */ ;
		margin-left: -100px ;
		margin-top:  -50px ;
		z-index: 999;
		width:  360px ;
		height: 300px ;
	    border: solid 2px rgba(222,60,80,.9);
		box-sizing: content-box;
		pointer-events: none;
	}
	
	.content
	{
		max-width: 700px;
	    padding: 0 1em;
	    margin: 0 auto;
	    text-align: center;
	    
	}
	
	.component
	{
		position: relative;
	    background: url(../img/gridme.png) repeat center center;
	    padding: 4em;
	    height: 500px ;
	    border: 3px solid #49708A;
	    max-width: 650px ;
	    overflow: hidden;
	    margin: 0 auto;
	
	}
	</style>
	
	<script type="text/javascript">
	function readURL(input)
	{
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	
	        reader.onload = function (e) {
	            $('.resize-image')
	                .attr('src', e.target.result);

	            init();
	           
	        };
	
	      reader.readAsDataURL(input.files[0]); 
	      
	     
	    }
	 
	}
	</script>
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li><a href="tours?tact=manageTours">
				List Gallery</li></a>
				<%if(gallerybean == null){ %>
				<li class="active">Add Gallery</li>
				<%}else{ %>
				<li class="active">Edit Gallery</li>
				<%} %>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			<%if(gallerybean == null){ %>
				<h1 class="page-header">Add Gallery</h1>
				<%}else{ %>
				<h1 class="page-header">Edit Gallery</h1>
				<%} %>
				
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<%if(gallerybean == null){ %>
				<div class="panel-heading">Add Gallery</div>
				<%}else{ %>
				<div class="panel-heading">Edit Gallery</div>
				<%} %>
					<div class="panel-body">
						<form role="form" action="gallery?action=addGallery" id="form" method="post" onsubmit="return imageValidate();">
						<div class="col-md-8">
								<div class="form-group">
									<label>Gallery Name</label>
									<input class="form-control" name="gallery_name" id="gallery_name" placeholder="Gallery Name" value="<%=(gallerybean!=null)?gallerybean.getGallery_name():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Gallery Description</label>
								    <textarea class="form-control" name="gallery_description" id="gallery_description" placeholder="Gallery Description" rows="4" cols="5"  required><%=(gallerybean!=null)?gallerybean.getGallery_description():""%></textarea>
								</div>
										 
											<div class="form-group">
                                            <label class="control-label">Gallery Photo</label>                               
                                            <input type="file"  name="img1" title="Please select the image" id="pic1"  onchange="readURL(this);"><br/>
                                            <textarea name="image_file" style="display: none;"class="form-control" id="dataURL" rows="100"></textarea>
                                            <input type="hidden" class="form-control" name="edit_img_url" value="<%=gallerybean!=null?gallerybean.getGallery_img():""%>">
                                            <div class="container" style="padding-right: 69%;">
											 <div class="content">			 	
											   <div class="component" style="width: 160%; /* height: 100%; */  /* width: 2025px; */ /* margin-left: -11%; */">
												<div class="overlay">
												 <div class="overlay-inner">
												 </div>
											    </div>
											 <%if(gallerybean!=null) {%>
											<img class="resize-image" src="fetchGallery?type=UserPhoto&image=<%=(gallerybean!=null)?gallerybean.getGallery_img():""%>" id="myimg" alt="image for resizing">
											<%}else {%>
											<img class="resize-image" style="color: red;" src="" id="myimg" alt="image for resizing">
											<%} %>
											<button class="btn-crop js-crop" type="button"  onclick="checkImg()">Crop<img class="icon-crop" src="img/crop.svg"></button>
											</div>
											 <div class="a-tip">
											  <p><strong>Hint:</strong> hold <span>SHIFT</span> while resizing to keep the original aspect ratio.</p>
											 </div>
																				
												</div><!-- /content -->
												  <div  id="showDataURL"></div>
									
										  </div> <!-- /container -->
                                      </div>
										 
										 
								<div class="form-group" style="display: none;">
									<label>Gallery Id</label>
									<input type="text" name="gallery_id" value="<%=(gallerybean!=null)?gallerybean.getGallery_id():""%>" >
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


</body>
</html>