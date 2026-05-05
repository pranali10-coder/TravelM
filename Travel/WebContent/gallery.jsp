<%@page import="com.ac.travel.bean.GalleryBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<style>
body {
	background-color: #16a085;
	color: #ecf0f1;
}
</style>
<head>
 <%@ include file="allcss.jsp" %> 
</head>

<body class="js">
    <%@ include file="header.jsp" %>
     
    <div class="avacus-page-header-section">
        <div class="display-table">
            <div class="display-cell">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
                       <img src="img/shrihari gallery 1920x250.jpg" alt="gallery" style="margin-top: -2%;">         
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-left">
                    <ol class="breadcrumb">
                        <li><a href="home">Home > </a></li>
                        <li class="active"> Gallery </li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- accordion section -->
    <!-- start avacus blog page   -->
    <section class="avacus-blogpage-area section-padding">
        <div class="container">
            <div class="row">
             <%ArrayList<GalleryBean> activelist = (ArrayList<GalleryBean>)request.getAttribute("glist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<GalleryBean>();
			                         }
			                         %>
			                        
			         				<%
			         				int i=1;
			                          for(GalleryBean bn :activelist){	 
			                        %>  
					                <div class="col-sm-4">
					               <div class="single-news single-grid">
								      <a href="fetchGallery?type=UserPhoto&image=<%=(bn.getGallery_img()!=null)?bn.getGallery_img():""%>" class="pp" target="blank"> 
									<img src="fetchGallery?type=UserPhoto&image=<%=(bn.getGallery_img()!=null)?bn.getGallery_img():""%>"  alt="gallery">	
									</a>
								</div>
							</div>
		 			 <%} %>
		</div>
	</div>
</section>

<%@ include file="footer.jsp" %>

<%@ include file="alljs.jsp" %>

<script type="text/javascript">

lightbox.option({
	'albumLabel':	"picture %1 of %2",
	'fadeDuration': 300,
	'resizeDuration': 150,
	'wrapAround': true
})
</script>
</body>
</html>
