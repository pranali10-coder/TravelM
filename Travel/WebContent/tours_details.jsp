<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.ac.travel.bean.ToursBean"%>
<html lang="en">
<head>
    <%@ include file="allcss.jsp" %> 
    <%ToursBean tbean=(ToursBean)request.getAttribute("tbean"); %>
    <title><%=tbean.getTours_name()%> | Shrihari Tours and Travels</title>
	<%-- <meta name="description" content="<%=tbean.getTours_desc()%>" />
    <meta property="og:title" content="<%=tbean.getTours_name()%>" />
    <meta property="og:description" content="<%=tbean.getTours_desc()%>"> --%>
    <meta property="og:image" content="http://www.regextech.com/sttimages/1577770117089.png"/>
    <meta property="og:image:type" content="image/png">
    
</head>

<body class="js">
<%@ include file="header.jsp" %>
  
    <!-- end of nav and menu area -->
    <div class="avacus-page-header-section">
        <div class="display-table">
            <div class="display-cell">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
						 <img src="img/shrihari tour details 1920x250.jpg" alt="tourslist" style="margin-top: -2%;"> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-left">
                    <ol class="breadcrumb">
                        <li><a href="home">Home  > </a></li>
                        <li class="active">Tours List > </li>
                        <li class="active">Tours Details</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- start why chose avacus -->
    <section class="avacus-services-two-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-4 col-md-3">
                    <div class="services-category">
                        <ul>
                            <li><a href="tours?tour=tours">Maharashtra Popular Tours Places</a></li>
                            <li><a href="tours?tour=Toursoutofmaha">Out of Maharashtra Popular Tours Places</a></li>
                            <li><a href="tours?tour=Toursoutofindia">Out of India Popular Tours Places</a></li>
                        </ul>
                    </div>
                    <div class="contact-us-widget">
                        <h2>Contact us</h2>
                        <span class="fa fa-home"></span>
                        <p>Pune Maharashtra.</p>
                        <ul>
                            <li><span class="fa fa-phone"></span> +91-8830827508</li>
                            <li><span class="fa fa-envelope"></span>info@shriharitours.com</li>
                        </ul>
                        <a class="get-quate-btn" href="Enquiry">Enquiry</a>
                    </div>
                </div>
                <div class="col-sm-8 col-md-9">
                    <div class="services-single-content">
                        <h2 class="post-title"><%=tbean.getTours_name() %></h2>
                      
                        
                        <div class="case-stady">
                            <div class="cash-thumb">
                              <img src="fetchGallery?type=UserPhoto&image=<%=(tbean.getTours_img()!=null)?tbean.getTours_img():""%>" >
                            </div>
                            
                            <div class="case-list">
                                <ul>
                                    <li>Days:&nbsp;<%=tbean.getTours_days() %></li>
                                    <li>Nights:&nbsp;<%=tbean.getTours_nights() %></li>
                                    <li>Single Person <span class="fa fa-inr"></span>&nbsp;<%=tbean.getTours_price() %></li>
                                    <li>Route: <%=tbean.getTours_route() %></li>
                                </ul>
                            </div>
                            <br><br>
						    <div class="social-icon">
						      <b>Share:</b>
	                            <a title="facebook" onclick="javascript:newPopup('https://www.facebook.com/sharer/sharer.php?u='+encodeURIComponent(location.href),'facebook-share-dialog','width=600,height=436');return false;" class="fs-18 cl7 hov-cl1 trans-04 m-r-4" target="blank">
									<i><img alt="" src="img/facebook.jpg" width="60" height="30"></i>
								</a>
                        
								<a href="whatsapp://send?text=" onclick="window.open('https://api.whatsapp.com/send?text='+encodeURIComponent(document.URL)); return false;" title="whatsapp" aria-label="whatsapp" class="fs-18 cl7 hov-cl1 trans-04 m-r-16" target="blank">
									<!-- <i class="fa fa-whatsapp"></i> -->
									<i><img alt="" src="img/whatsapp.png" width="45" height="40"></i>
								</a>
	                        </div>		
                        
                        </div>
                        <p><%=tbean.getTours_desc() %></p>
                    </div>
                </div>
            </div>
        </div>
    </section>

<%@ include file="footer.jsp" %>


<%@ include file="alljs.jsp" %>
<script type="text/javascript">
// Popup window code
function newPopup(url) {
popupWindow = window.open(
url,'popUpWindow','height=300,width=400,left=10,top=10,resizable=yes,scrollbars=yes,toolbar=yes,menubar=no,location=no,directories=no,status=yes')
}
</script>
			
</body>
</html>
