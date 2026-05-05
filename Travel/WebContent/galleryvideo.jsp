<%@page import="com.ac.travel.bean.GalleryVideoBean"%>
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
             <%ArrayList<GalleryVideoBean> activelist = (ArrayList<GalleryVideoBean>)request.getAttribute("gvlist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<GalleryVideoBean>();
			                         }
			                         %>
			                        
			         				<%
			         				int i=1;
			                          for(GalleryVideoBean bn :activelist){	 
			                        %>  
			                         <div class="col-sm-4">
                                       <div class="company-video">
                                            <img src="img/stnt.jpg" alt="video">
                                           <a href="<%=(bn.getGalleryVideo_link()!=null)?bn.getGalleryVideo_link():""%>" class="pp"><img src="img/play.png" alt=""></a>
                                       </div><br	>
                                         <h4 style="text-align: center;"><%=bn.getGalleryvideo_name() %> </h4>
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
