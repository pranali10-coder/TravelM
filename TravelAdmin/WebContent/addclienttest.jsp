<%@page import="com.ac.travel.bean.ClientTestoBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<%ClientTestoBean ctbean=(ClientTestoBean)request.getAttribute("ctb"); %>	

<%@include file="allcss.jsp"%>	
<title>Client Testimonial   |<%if(ctbean==null){%> Add Client Testimonial<%}else{ %>Client Testimonial Edit<%}%></title>

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
		width:  140px ;
		height: 140px ;
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
	
	<style type="text/css">
	*{
    margin: 0;
    padding: 0;
}
.rate {
    float: left;
    height: 46px;
    padding: 0 10px;
}
.rate:not(:checked) > input {
    position:absolute;
    top:-9999px;
}
.rate:not(:checked) > label {
    float:right;
    width:1em;
    overflow:hidden;
    white-space:nowrap;
    cursor:pointer;
    font-size:30px;
    color:#ccc;
}
.rate:not(:checked) > label:before {
    content: '★ ';
}
.rate > input:checked ~ label {
    color: #ffc700;    
}
.rate:not(:checked) > label:hover,
.rate:not(:checked) > label:hover ~ label {
    color: #deb217;  
}
.rate > input:checked + label:hover,
.rate > input:checked + label:hover ~ label,
.rate > input:checked ~ label:hover,
.rate > input:checked ~ label:hover ~ label,
.rate > label:hover ~ input:checked ~ label {
    color: #c59b08;
}
	
	</style>
	
	
</head>
<body>
<%@include file="adminleftmenu.jsp"%>
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="manageAdmin">
					<em class="fa fa-home"></em>
				</a></li>
				<li><a href="clienttesto?cact=manageTesto">
				Client Testimonial List</li></a>
				<%if(ctbean == null){ %>
				<li class="active">Add Client Testimonial</li>
				<%}else{ %>
				<li class="active">Edit Client Testimonial</li>
				<%} %>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			<%if(ctbean == null){ %>
				<h1 class="page-header">Add Client Testimonial</h1>
				<%}else{ %>
				<h1 class="page-header">Edit Client Testimonial</h1>
				<%} %>
				
			</div>
		</div><!--/.row-->
				
		
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
				<%if(ctbean == null){ %>
				<div class="panel-heading">Add Client Testimonial</div>
				<%}else{ %>
				<div class="panel-heading">Edit Client Testimonial</div>
				<%} %>
					<div class="panel-body">
						<form role="form" action="clienttesto?cact=addTesto" id="form" method="post" onsubmit="return imageValidate();">
						<div class="col-md-8">
								<div class="form-group">
									<label>Name</label>
									<input class="form-control" name="client_name" id="client_name" placeholder="Tours Client Name" value="<%=(ctbean!=null)?ctbean.getClient_name():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Designation</label>
									<input class="form-control" name="client_designation" id="client_designation" placeholder="Client Designation" value="<%=(ctbean!=null)?ctbean.getClient_name():""%>" required>
								</div>
								
								<div class="form-group">
									<label>Tours Experience</label>
								    <textarea class="form-control" name="client_description" id="client_description" placeholder="Tours Client Experience" rows="4" cols="5"  required><%=(ctbean!=null)?ctbean.getClient_description():""%></textarea>
								</div>
											<div class="form-group">
                                            <label class="control-label">Photo</label>                               
                                            <input type="file"  name="img1" title="Please select the image" id="pic1"  onchange="readURL(this);"><br/>
                                            <textarea name="image_file" style="display: none;"class="form-control" id="dataURL" rows="100"></textarea>
                                            <input type="hidden" class="form-control" name="edit_img_url" value="<%=ctbean!=null?ctbean.getClient_img():""%>">
                                            <div class="container" style="padding-right: 69%;">
											 <div class="content">			 	
											   <div class="component" style="width: 160%; /* height: 100%; */  /* width: 2025px; */ /* margin-left: -11%; */">
												<div class="overlay">
												 <div class="overlay-inner">
												 </div>
											    </div>
											 <%if(ctbean!=null) {%>
											<img class="resize-image" src="fetchGallery?type=UserPhoto&image=<%=(ctbean!=null)?ctbean.getClient_img():""%>" id="myimg" alt="image for resizing">
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
										 
								<label class="form-group">Tours Experienace Rating</label>
								   <div class="rate">
									    <input type="radio" class="form-group" id="star5" name="rate" value="5"  <%=(ctbean!=null)?(ctbean.getClient_rate().equalsIgnoreCase("5"))?"checked='checked'":"":""%> />
									    <label for="star5"  title="text">5 stars</label>
									    <input type="radio" class="form-group" id="star4" name="rate" value="4"  <%=(ctbean!=null)?(ctbean.getClient_rate().equalsIgnoreCase("4"))?"checked='checked'":"":""%> />
									    <label for="star4"  title="text">4 stars</label>
									    <input type="radio" class="form-group" id="star3" name="rate" value="3"  <%=(ctbean!=null)?(ctbean.getClient_rate().equalsIgnoreCase("3"))?"checked='checked'":"":""%> />
									    <label for="star3" title="text">3 stars</label>
									    <input type="radio" class="form-group" id="star2" name="rate" value="2"  <%=(ctbean!=null)?(ctbean.getClient_rate().equalsIgnoreCase("2"))?"checked='checked'":"":""%>/>
									    <label for="star2" title="text">2 stars</label>
									    <input type="radio" class="form-group" id="star1" name="rate" value="1"  <%=(ctbean!=null)?(ctbean.getClient_rate().equalsIgnoreCase("1"))?"checked='checked'":"":""%>/>
									    <label for="star1" title="text">1 star</label>
								 </div>
						           <br><br>	 
								<div class="form-group" style="display: none;">
									<label> Id</label>
									<input type="text" name="client_id" value="<%=(ctbean!=null)?ctbean.getClient_id():""%>" >
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