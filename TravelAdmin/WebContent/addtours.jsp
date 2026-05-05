<%@page import="com.ac.travel.bean.ToursBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<%ToursBean tourbean=(ToursBean)request.getAttribute("tb"); %>	

<%@include file="allcss.jsp"%>	
<title>Travel  |<%if(tourbean==null){%>Add Tours<%}else{ %>Edit Tours<%}%></title>

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
				<li><a href="gallery?gact=manageGallery">
				List Tours</li></a>
				<%if(tourbean == null){ %>
				<li class="active">Add Tours</li>
				<%}else{ %>
				<li class="active">Edit Tours</li>
				<%} %>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			<%if(tourbean == null){ %>
				<h1 class="page-header">Add Tours</h1>
				<%}else{ %>
				<h1 class="page-header">Edit Tours</h1>
				<%} %>
				
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<%if(tourbean == null){ %>
				<div class="panel-heading">Add Tours</div>
				<%}else{ %>
				<div class="panel-heading">Edit Tours</div>
				<%} %>
					<div class="panel-body">
						<form role="form" action="tours?action=addTours" id="form" method="post" onsubmit="return imageValidate();">
						<div class="col-md-8">
								<div class="form-group">
									<label>Tours Location</label>
									 <select class="form-control" id="tours_type" name="tours_type"  title="Select Tours Location" required>
	                           		<option value="">Tours Location</option>
	                           		<option value="1" <%=(tourbean!=null)?(tourbean.getTours_type().equalsIgnoreCase("1"))?"selected='selected'":"":""%>>Maharashtra Popular Locations</option>
	                           		<option value="2" <%=(tourbean!=null)?(tourbean.getTours_type().equalsIgnoreCase("2"))?"selected='selected'":"":""%>>Out Maharashtra Popular Locations</option>
	                           		<option value="3" <%=(tourbean!=null)?(tourbean.getTours_type().equalsIgnoreCase("3"))?"selected='selected'":"":""%>>Out India Popular Locations</option>  		 
	                            </select>
								</div>
								
								<div class="form-group">
									<label>Tours Name</label>
									<input class="form-control" name="tours_name" id="tours_name" placeholder="Tours Name" value="<%=(tourbean!=null)?tourbean.getTours_name():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Tours Description</label>
								    <textarea class="form-control" name="tours_desc" id="tours_desc" placeholder="Tours Description" rows="4" cols="5"  required><%=(tourbean!=null)?tourbean.getTours_desc():""%></textarea>
								</div>
								
								<div class="form-group">
									<label>Tours Price </label>
									<input class="form-control" name="tours_price" id="tours_price" placeholder="Tours Price" value="<%=(tourbean!=null)?tourbean.getTours_price():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Tours Days </label>
									<input class="form-control" name="tours_days" id="tours_days" placeholder="Tours Days" value="<%=(tourbean!=null)?tourbean.getTours_days():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Tours Nights</label>
									<input class="form-control" name="tours_nights" id="tours_nights" placeholder="Tours Nights" value="<%=(tourbean!=null)?tourbean.getTours_nights():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Tours Route</label>
									<input class="form-control" name="tours_route" id="tours_route" placeholder="Tours Route" value="<%=(tourbean!=null)?tourbean.getTours_route():""%>" required>
								</div>
								
								<div class="form-group">
	                                         <label class="control-label">Tours Route Photo</label>                               
	                                         <input type="file"  name="img1" title="Please select the image" id="pic1"  onchange="readURL(this);"><br/>
	                                         <textarea name="image_file" style="display: none;"class="form-control" id="dataURL" rows="100"></textarea>
	                                         <input type="hidden" class="form-control" name="edit_img_url" value="<%=tourbean!=null?tourbean.getTours_img():""%>">
	                                         <div class="container" style="padding-right: 69%;">
									 <div class="content">			 	
									   <div class="component" style="width: 160%; /* height: 100%; */  /* width: 2025px; */ /* margin-left: -11%; */">
										<div class="overlay">
								 <div class="overlay-inner">
								 </div>
							    </div>
									 <%if(tourbean!=null) {%>
									<img class="resize-image" src="fetchGallery?type=UserPhoto&image=<%=(tourbean!=null)?tourbean.getTours_img():""%>" id="myimg" alt="image for resizing">
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
									<label>Tours Id</label>
									<input type="text" name="tours_id" value="<%=(tourbean!=null)?tourbean.getTours_id():""%>" >
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