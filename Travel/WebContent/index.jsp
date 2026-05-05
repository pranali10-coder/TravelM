<!DOCTYPE html>
<%@page import="com.ac.travel.bean.ClientTestoBean"%>
<%@page import="com.ac.travel.controller.Controller"%>
<%@page import="com.ac.travel.dao.ToursDao"%>
<%@page import="com.ac.travel.bean.ToursBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.ac.travel.dao.SliderDao"%>
<%@page import="com.ac.travel.bean.SliderBean"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
<title>Online Tours and Travels, Tour Booking in Phaltan, Travels Booking in Phaltan,Maharashtra tours | Shrihari Tours and Travels</title>
<%@ include file="allcss.jsp" %> 

<link rel="stylesheet" href="css1/assets/css/animate.css">
<link rel="stylesheet" href="css1/assets/css/carousel.css">
<link rel="stylesheet" href="css1/assets/css/media-queries.css">
<link rel="stylesheet" href="css1/assets/css/style.css">
<link rel="stylesheet" href="css/w3.css">
<style>
.mySlides {display:none;}
</style>

<style type="text/css">

#hh1:after {
    text-align:center;
    content:' ';
    position: absolute;
    display:block;
    width: 80px;
  	margin: 0 2%;
  	margin-left: 37.5%;
    border:2px solid #e2a750;
    border-radius:4px;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    box-shadow:inset 0 1px 1px rgba(0, 0, 0, .05);
    -webkit-box-shadow:inset 0 1px 1px rgba(0, 0, 0, .05);
    -moz-box-shadow:inset 0 1px 1px rgba(0, 0, 0, .05);
     
}
</style>
<style type="text/css">
@media screen and (max-width: 600px)  {
 #w3-content {
  margin-top: -10%; 
 }
}
</style> 

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

<body class="js">
    <%@ include file="header.jsp" %>
    
    <!-- start hero slider area -->
    <!-- start-slider-area  -->
    <section class="home-area">
  <%--       <div class="Modern-Slider">

			        <% List<SliderBean> sliderbean=new Controller().getSliderList();
		  		 if(sliderbean==null)
			     {
		  			sliderbean=new ArrayList<SliderBean>();
			     }     
			   %>
			   <% for(SliderBean sb:sliderbean)
    		 	 { %>
            <!-- Item -->
            <div class="item">
                <div class="img-fill">
                   <img src="fetchGallery?type=UserPhoto&image=<%=(sb.getSlider_img()!=null)?sb.getSlider_img():""%>" >
                </div>
            </div>
            <!-- // Item -->
		  <%}%>    
        </div> --%>
          <div class="Modern-Slider">
            <% List<SliderBean> sliderbean=new Controller().getSliderList();
		  		 if(sliderbean==null)
			     {
		  			sliderbean=new ArrayList<SliderBean>();
			     }     
			   %>
        			<div class="w3-content w3-display-container" id="w3-content" style="max-width:5000px;">
				 <% 
                    int i=1;
                    for(SliderBean sb:sliderbean){
                  	  if(sb.getSlider_status().equalsIgnoreCase("1")) 
                   	 {
                  	  %> 
				  <img class="mySlides" src="fetchGallery?type=UserPhoto&image=<%=(sb.getSlider_img()!=null)?sb.getSlider_img():""%>" style="width:100%;">
				  <% }} %>
				 
				</div>
				</div>
				<!-- Slider Area End -->
    </section>
    <!-- end of hero slider area -->
    <section class="why-chose-avacuse section-padding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <div class="section-title">
                        <h4 style="line-height: 1.5;">Welcome to Travel</h4>
                        <h2 style="line-height: 1.5;">Why choose us?</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4">
                    <div class="single-why-chose">
                        <div class="why-thumb">
                            <img src="img/shrihari dharmik 360x250.jpg" alt="why chose">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="single-why-chose">
                        <div class="why-thumb">
                            <img src="img/shrihari group tours 360x250.jpg" alt="why chose">
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="single-why-chose">
                        <div class="why-thumb">
                            <img src="img/shrihari bharartabaheril 360x250.jpg" alt="why chose">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of why chose avacus -->
    <!-- start services section -->
    <section class="avacus-services-section section-padding">
        <div class="container">
            <div class="row">
          <!--       <div class="col-xs-12 text-center">
                    <div class="section-title">
                        <h2>आम्ही ऑफर केलेल्या सेवा</h2>
                    </div>
                </div> -->
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class="avacus-single-services">
                        <div class="services-icon-title">
                            <div class="service-icon">
                                <i class="fa fa-user"></i>
                            </div>
                            <div class="service-ttile">
                                <h4>60+Expert team</h4>
                            </div>
                        </div>
                    </div>
                </div>
               <!--  <div class="col-sm-4">
                    <div class="avacus-single-services">
                        <div class="services-icon-title">
                            <div class="service-icon">
                                <i class="fa fa-inr"></i>
                            </div>
                            <div class="service-ttile">
                                <h4>टूर ऑन झिरो मनी घेऊन जा</h4>
                            </div>
                        </div>
                    </div>
                </div> -->
                <div class="col-sm-6">
                    <div class="avacus-single-services">
                        <div class="services-icon-title">
                            <div class="service-icon">
                                <i class="fa fa-futbol-o"></i>
                            </div>
                            <div class="service-ttile">
                                <h4>Enjoyment garrentee</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of services section -->
    
    <!-- end of history section -->
    <div class="avacus-count-down-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-3">
                    <div class="single-count-down">
                        <h2 class="counter">700+</h2>
                        <h4>Tours Completed</h4>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="single-count-down">
                        <h2 class="counter">60+</h2>
                        <h4>Tours Leaders</h4>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="single-count-down">
                        <h2 class="counter">20</h2>
                        <h4>Awards</h4>
                    </div>
                </div>
                <div class="col-sm-3">
                    <div class="single-count-down">
                        <h2 class="counter">7500+</h2>
                        <h4>Satiesfied Clients</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- end of count down section -->
    
    <!-- start latest news section -->
    <section class="avacus-latest-news-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <div class="section-title">
                        <h4>Our Tours</h4>
                        <h2>Maharashtra Popular Tours Places</h2>
                    </div>
                </div>
            </div>
            <div class="row latest-project-slider">
             <% List<ToursBean> toursbean=new Controller().getToursList();
		  		 if(toursbean==null)
			     {
		  			toursbean=new ArrayList<ToursBean>();
			     }     
			   %>
			      <% List<ToursBean> subList;
			        
			        if(toursbean!=null&toursbean.size()>6)
			        {subList = new ArrayList<ToursBean>(toursbean.subList(0, 6));}
			        else{subList = toursbean;}
			        %>
			   <% for(ToursBean tb1:toursbean)
    		 	 { 
    		 	   if(tb1.getTours_type().equalsIgnoreCase("1")) 
              	 {
    		 	 %>
                <div class="col-sm-4">
                    <div class="single-news">
                        <div class="news-thumb">
                             <a href="tours?tour=tours"><img src="fetchGallery?type=UserPhoto&image=<%=(tb1.getTours_img()!=null)?tb1.getTours_img():""%>"></a>
                        </div>
                      <a href="tours?tour=tours"><h3><%=tb1.getTours_name()!=null?tb1.getTours_name():""%></h3></a>
                         <div class="product-price-rating">
                            <div class="product-price">
                               <span class="fa fa-clock-o"></span>&nbsp;&nbsp;Days :&nbsp;<%=tb1.getTours_days()!=null?tb1.getTours_days():""%>
                            </div>
                             <div class="puplar-rating">
                               <span class="fa fa-clock-o"></span>&nbsp;&nbsp;Nights:&nbsp;<%=tb1.getTours_nights()!=null?tb1.getTours_nights():""%>
                             </div>
                          </div>
                         <a class="add-to-cart" href="tours?tour=tours" style="color: white;">Per Person &nbsp;<span class="fa fa-inr"></span>&nbsp; <%=tb1.getTours_price()!=null?tb1.getTours_price():""%>*</a>
                    </div>
                </div>
			  <%}}%>
            </div>
        </div>
    </section>
    <!-- end of latest news section -->
    
    
     <!-- start latest news section -->
  <section class="avacus-latest-news-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <div class="section-title">
                        <h4>Our Tours</h4>
                        <h2>Out of Maharashtra Popular Tours Places</h2>
                    </div>
                </div>
            </div>
            <div class="row latest-project-slider">
             <% List<ToursBean> toursbean1=new Controller().getToursoutofmahaList();
		  		 if(toursbean1==null)
			     {
		  			toursbean1=new ArrayList<ToursBean>();
			     }     
			   %>
			    <% List<ToursBean> subList1;
			        
			        if(toursbean1!=null&toursbean1.size()>6)
			        {subList = new ArrayList<ToursBean>(toursbean1.subList(0, 6));}
			        else{subList = toursbean1;}
			        %>
			   <% for(ToursBean tb2:toursbean1)
    		 	 {
				   if(tb2.getTours_type().equalsIgnoreCase("2")) 
	              	 {
				   %>
                <div class="col-sm-4">
                    <div class="single-news">
                        <div class="news-thumb">
                           <a href="tours?tour=Toursoutofmaha"><img src="fetchGallery?type=UserPhoto&image=<%=(tb2.getTours_img()!=null)?tb2.getTours_img():""%>" ></a>
                        </div>
                        <h3><%=tb2.getTours_name()!=null?tb2.getTours_name():""%></h3>
                          <div class="product-price-rating">
                            <div class="product-price">
                              <span class="fa fa-clock-o"></span>&nbsp;&nbsp;Days :&nbsp;<%=tb2.getTours_days()!=null?tb2.getTours_days():""%>
                            </div>
                             <div class="puplar-rating">
                               <span class="fa fa-clock-o"></span>&nbsp;&nbsp;Nights :&nbsp;<%=tb2.getTours_nights()!=null?tb2.getTours_nights():""%>
                             </div>
                          </div>
                         <a class="add-to-cart" href="tours?tour=Toursoutofmaha" style="color: white;">Per Person &nbsp;<span class="fa fa-inr"></span>&nbsp;<%=tb2.getTours_price()!=null?tb2.getTours_price():""%>*</a>
                    </div>
                </div>
			  <%}}%>
            </div>
        </div>
    </section> 
    <!-- end of latest news section -->
    
      <!-- start latest news section -->
      
    <section class="avacus-latest-news-section section-padding">
        <div class="container">
         <% List<ToursBean> toursbean2=new Controller().getToursoutofindiaList();
    	 if(toursbean2==null)
	     {
  			toursbean2=new ArrayList<ToursBean>();
	     }     
	   %>
            <div class="row">
                <div class="col-sm-12 text-center">
                    <div class="section-title">
                        <h4>Our Tours</h4>
                        <h2>Out of India Popular Tours Places</h2>
                    </div>
                </div>
            </div>
            <div class="row latest-project-slider">
		  	 <% List<ToursBean> subList2;
			        
			        if(toursbean2!=null&toursbean2.size()>6)
			        {subList = new ArrayList<ToursBean>(toursbean2.subList(0, 6));}
			        else{subList = toursbean2;}
			        %>
			   <% for(ToursBean tb3:toursbean2)
    		 	 {
				   if(tb3.getTours_type().equalsIgnoreCase("3")) 
              	 {
				   %>
                <div class="col-sm-4">
                    <div class="single-news">
                        <div class="news-thumb">
                            <a href="tours?tour=Toursoutofindia"><img src="fetchGallery?type=UserPhoto&image=<%=(tb3.getTours_img()!=null)?tb3.getTours_img():""%>" ></a>
                        </div>
                        <h3><%=tb3.getTours_name()!=null?tb3.getTours_name():""%></h3>
                         <div class="product-price-rating">
                            <div class="product-price">
                               <a href="tours?tour=Toursoutofindia"><span class="fa fa-clock-o"></span>&nbsp;&nbsp;दिवस:&nbsp;<%=tb3.getTours_days()!=null?tb3.getTours_days():""%></a>
                            </div>
                             <div class="puplar-rating">
                                 <a href="tours?tour=Toursoutofindia"><span class="fa fa-clock-o"></span>&nbsp;&nbsp;रात्री:&nbsp;<%=tb3.getTours_nights()!=null?tb3.getTours_nights():""%></a> 
                             </div>
                          </div>
                         <a class="add-to-cart" href="tours?tour=Toursoutofindia" style="color: white;">प्रत्येकी &nbsp;<span class="fa fa-inr"></span>&nbsp;<%=tb3.getTours_price()!=null?tb3.getTours_price():""%>*</a>
                    </div>
                </div>
			  <%}}%>
            </div>
        </div>
    </section> 
    <!-- end of latest news section -->
   
    <!-- start testimonial section -->
    <section class="avacus-testimonial-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <div class="section-title">
                        <h4>Our Clients Feedback</h4>
                        <h2>Clients Testimonials?</h2>
                    </div>
                </div>
            </div>
            <div class="row avacus-client-slider">
              <% List<ClientTestoBean> ctbean=new Controller().getClientTestoList();
    			 if(ctbean==null)
			     {
    				 ctbean=new ArrayList<ClientTestoBean>();
			     }     
	 		  %>
            
           
			   <%for(ClientTestoBean ct:ctbean)
    		 	 {
				   %> 
                <div class="col-sm-6">
                    <div class="avacus-singel-testimonial">
                        <div class="client-face-title">
                            <div class="client-face">
                               <img src="fetchGallery?type=UserPhoto&image=<%=(ct.getClient_img()!=null)?ct.getClient_img():""%>" >
                            </div>
                            <div class="client-title">
                                <h4><%=ct.getClient_name()!=null?ct.getClient_name():""%></h4>
                                <p><%=ct.getClient_designation()!=null?ct.getClient_designation():""%></p>
                                <p><%=ct.getClient_description()!=null?ct.getClient_description():""%></p>
                                <div class="client-rating">
  									<div class="rate">
									    <input type="radio" class="form-group" id="star5" name="rate" value="5"  <%=(ct!=null)?(ct.getClient_rate().equalsIgnoreCase("5"))?"checked='checked'":"":""%> />
									    <label for="star5"  title="text">5 stars</label>
									    <input type="radio" class="form-group" id="star4" name="rate" value="4"  <%=(ct!=null)?(ct.getClient_rate().equalsIgnoreCase("4"))?"checked='checked'":"":""%> />
									    <label for="star4"  title="text">4 stars</label>
									    <input type="radio" class="form-group" id="star3" name="rate" value="3"  <%=(ct!=null)?(ct.getClient_rate().equalsIgnoreCase("3"))?"checked='checked'":"":""%> />
									    <label for="star3" title="text">3 stars</label>
									    <input type="radio" class="form-group" id="star2" name="rate" value="2"  <%=(ct!=null)?(ct.getClient_rate().equalsIgnoreCase("2"))?"checked='checked'":"":""%>/>
									    <label for="star2" title="text">2 stars</label>
									    <input type="radio" class="form-group" id="star1" name="rate" value="1"  <%=(ct!=null)?(ct.getClient_rate().equalsIgnoreCase("1"))?"checked='checked'":"":""%>/>
									    <label for="star1" title="text">1 star</label>
									 </div>
                                </div>
                            </div>
                        </div>
                       
                    </div>
                </div>
                 <%}%>
            </div>
        </div>
    </section>
    <!-- end of testimonial section -->
  
    <!-- start footer section -->
<%@ include file="footer.jsp" %>


<%@ include file="alljs.jsp" %>

<script src="css1/assets/js/jquery.backstretch.min.js"></script>
 <script src="css1/assets/js/wow.min.js"></script>
 <script src="css1/assets/js/scripts.js"></script>
 <script>
var myIndex = 0;
carousel();
function carousel() {
  var i;
  var x = document.getElementsByClassName("mySlides");
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none";  
  }
  myIndex++;
  if (myIndex > x.length) {myIndex = 1}    
  x[myIndex-1].style.display = "block";  
  setTimeout(carousel, 4000); // Change image every 2 seconds
}
</script>
<script type="text/javascript">
var slideIndex = 1;
showDivs(slideIndex);

function plusDivs(n) {
  showDivs(slideIndex += n);
}

function showDivs(n) {
  var i;
  var x = document.getElementsByClassName("mySlides");
  if (n > x.length) {slideIndex = 1} 
  if (n < 1) {slideIndex = x.length} ;
  for (i = 0; i < x.length; i++) {
    x[i].style.display = "none"; 
  }
  x[slideIndex-1].style.display = "block"; 
}

</script>
</body>
</html>
