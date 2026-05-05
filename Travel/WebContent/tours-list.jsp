<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.ac.travel.bean.ToursBean"%>
<%@page import="java.util.ArrayList"%>
<html lang="en">
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
                        <li class="active">Tours </li>
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
                 <%ArrayList<ToursBean> activelist = (ArrayList<ToursBean>)request.getAttribute("tlist"); 
			                         if(activelist==null)
			                         {
			                        	 activelist=new ArrayList<ToursBean>();
			                         }
			                         %>
			                        
			         <%
			         				int i=1;
			                          for(ToursBean bn :activelist){
			                        	  if(bn.getTours_status().equalsIgnoreCase("1") && bn.getTours_type().equalsIgnoreCase("1"))
				                        	 {
			                        	  %>  

				<div class="col-sm-3">
                    <div class="single-news single-grid">
                        <div class="news-thumb">
                              <a href="tours?tour=viewtours-details&tours_id=<%=bn.getTours_id()%>"><img src="fetchGallery?type=UserPhoto&image=<%=(bn.getTours_img()!=null)?bn.getTours_img():""%>" ></a>
                        </div>
                        <a href="tours?tour=viewtours-details&tours_id=<%=bn.getTours_id()%>"><h3><%=bn.getTours_name()!=null?bn.getTours_name():""%></h3></a>
                       <div class="product-price-rating">
                            <div class="product-price">
                               <span class="fa fa-clock-o"></span>&nbsp;&nbsp;Days:&nbsp;<%=bn.getTours_days()!=null?bn.getTours_days():""%>
                            </div>
                             <div class="puplar-rating">
                               <span class="fa fa-clock-o"></span>&nbsp;&nbsp;Nights:&nbsp;<%=bn.getTours_nights()!=null?bn.getTours_nights():""%>
                             </div>
                          </div>
                         <a class="add-to-cart" href="tours?tour=viewtours-details&tours_id=<%=bn.getTours_id()%>" style="color: white;">Per Person &nbsp;<span class="fa fa-inr"></span>&nbsp; <%=bn.getTours_price()!=null?bn.getTours_price():""%>*</a>
                    </div>
                </div>
               <%}} %>
        </div>
    </section>
    <!-- end of avacus blog page -->
    <section class="avacus-quote-section">
        <div class="container">
            <div class="row">
                <div class="col-sm-8">
                    <div class="quote-text">
                        <h3>Do you search expert for tours?</h3>
                    </div>
                </div>
                <div class="col-sm-4 text-right">
                    <div class="quote-btn">
                        <a href="Enquiry">Tour Enquiry</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- end of accordio section -->
    <!-- start footer section -->
<%@ include file="footer.jsp" %>


<%@ include file="alljs.jsp" %>

</body>

</html>
