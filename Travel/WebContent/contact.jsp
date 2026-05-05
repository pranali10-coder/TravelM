<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html lang="en">
<head>
 <%@ include file="allcss.jsp" %>   
 
<!--  <script type="text/javascript" src="jsmar/pramukhime.js"></script>
 <script type="text/javascript" src="jsmar/pramukhindic.js"></script> -->
</head>

<body class="js">
 <%@ include file="header.jsp" %>
    <div class="avacus-page-header-section">
        <div class="display-table">
            <div class="display-cell">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12">
  						<img src="img/shrihari contact 1920x250.jpg" alt="contactus" style="margin-top: -2%;">         
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
                        <li class="active">Contact</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- accordion section -->
    <section class="contact-address-with-map section-padding">
        <div class="container">
            <div class="row">
                <div class="col-sm-5">
                    <div class="map-accourdion">
                        <div class="contact-address">
                                            <ul>
                                                <li>
                                                    <span class="fa fa-home"></span>
                                                    <p><strong>Address:</strong></p>
                                                    <p>Pune Maharashtra.</p>
                                                </li>
                                                <li>
                                                    <span class="fa fa-phone"></span>
                                                    <p><strong>Mobile No:</strong></p>
                                                    <p>+91-8830827508</p>
                                                </li>
                                                <li>
                                                    <span class="fa fa-envelope"></span>
                                                    <p><strong>Email Id:</strong></p>
                                                    <p> pranalimore9696@gmail.com</p>
                                                </li>
                                            </ul>
                                        </div>
                    </div>
                </div>
                <div class="col-sm-7">
                    <div class="google-map">
                     <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3794.726802358534!2d74.42870331488494!3d17.99144308771936!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x6e9fde8d6973f84f!2sShrihari%20Tours%20and%20Travels!5e0!3m2!1sen!2sin!4v1575872481119!5m2!1sen!2sin" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="contact-form-section section-padding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <div class="section-title">
                        <h4>Do you search expert for tours</h4>
                        <h2>Enquire Now</h2>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-sm-6 col-md-8 col-md-offset-2">
                        <form action="Contact" method="post">
                            <div class="row">
                                <div class="col-sm-12 col-md-6 padding-right-0">
                                    <div class="single-input-contact">
                                        <input type="text" name="name" id="name" placeholder="Your Name*" onkeypress="return ValidateAlpha(event)" required="required"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="single-input-contact">
                                        <input class="input-form" type="email" name="email" placeholder="Your Email id" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required="required"/>
                                    </div>
                                </div>
                                 <div class="col-sm-12">
                                    <div class="single-input-contact">
                                        <input type="text" name="phone" id="phone" placeholder="Mobile No ..*" pattern="[789][0-9]{9}" maxlength="10" min="0"  required="required">
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="contact-message">
                                        <textarea name="message" placeholder="Messsege ..." required="required" ></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <button class="submit" type="submit">Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
    <!-- start footer section -->
<%@ include file="footer.jsp" %>


<%@ include file="alljs.jsp" %>
     <!--   <script type="text/javascript">
     pramukhIME.addKeyboard(PramukhIndic,"marathi"); 
     pramukhIME.enable();
    </script>  -->
</body>
</html>
