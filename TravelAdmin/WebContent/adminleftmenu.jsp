<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="shortcut icon" href="#" type="image/x-icon" />
<title></title>

</head>
<body>

	<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#sidebar-collapse"><span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span></button>
				<a class="navbar-brand" href="manageAdmin?action=adminhome"><span></span>Travel Admin</a>
			</div>
		</div><!-- /.container-fluid -->
	</nav>
	<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<div class="profile-sidebar">
			<div class="profile-userpic">
				<img src="img/travel logo.png"  class="img-responsive" alt="logo" style="height: 100px;width: 100px;" > 
			</div>
			<div class="profile-usertitle">
				<div class="profile-usertitle-name">Travel</div>
				<div class="profile-usertitle-status"><span class="indicator label-success"></span>Online</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="divider"></div>
		
		<ul class="nav menu">
			<li class="active"><a href="manageAdmin"><em class="fa fa-dashboard">&nbsp;</em>Dashboard</a></li>
			<li><a class="" href="tours?tact=manageTours">
				<span class="fa fa-arrow-right">&nbsp;</span>Manage Tours
			</a></li>
			 
			 <li><a class="" href="slider?sact=manageSlider">
			 <span class="fa fa-navicon">&nbsp;</span>Manage Slider</a></li>
			 
			 <li><a class="" href="managecontact?contact=contact">
			 <span class="fa fa-navicon">&nbsp;</span>Enquiry</a></li>
			 
			  <li><a class="" href="clienttesto?cact=manageTesto">
			 <span class="fa fa-navicon">&nbsp;</span>Tours Testimonial</a></li>
			 
					<li><a class="" href="gallery?gact=manageGallery">
						<span class="fa fa-arrow-right">&nbsp;</span>Gallery Photo
					</a></li>
					<li><a class="" href="galleryVideo?gact=manageGalleryVideo">
						<span class="fa fa-arrow-right">&nbsp;</span>Gallery Video
					</a></li>
			 	
			<li><a href="Logout?action=logout"><em class="fa fa-power-off">&nbsp;</em>Logout</a></li>
		</ul>
	</div><!--/.sidebar-->


</body>
</html>
