<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
						<img src="img/shrihari enquiry 1920x250.jpg" alt="inquiry" style="margin-top: -2%;"> 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-left">
                    <ol class="breadcrumb">
                        <li><a href="home">Home> </a></li>
                        <li class="active">Enquiry</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- accordion section -->

    <section class="contact-form-section paddingTop-plus section-padding">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 text-center">
                    <div class="section-title">
                        <h4>Talk with our expert consult</h4>
                        <h2>Enquire Now</h2>
                    </div>
                </div>
            </div>
            <div class="container consultation-form">
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <form action="Enquiry" method="post" id="myform">
                            <div class="row">
                                <div class="col-sm-12 col-md-6 padding-right-0">
                                    <div class="single-input-contact">
                                      <input type="text" name="name" id="name" placeholder="Your Name*" onkeypress="return ValidateAlpha(event)" required="required"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="single-input-contact">
                                      <input class="input-form" type="email" name="email" placeholder="Your Email*" id="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"  required="required"/>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6 padding-right-0">
                                    <div class="single-input-contact">
                                        <input type="text" name="phone" id="phone" placeholder="Mobile No*" pattern="[789][0-9]{9}" maxlength="10" min="0" required="required">
                                    </div>
                                </div>
                                <div class="col-sm-12 col-md-6">
                                    <div class="single-input-contact selectarrow">
                                        <select name="toursub" id="Choose" class="required">
                                            <option value="Choose">Subject</option>
                                            <option value="tours">Maharashtra Popular Tours Places</option>
                                            <option value="outofmah">Out of Maharashtra Popular Tours Places</option>
                                            <option value="outofind">Out of India Popular Tours Places</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="contact-message">
                                        <textarea name="message" placeholder="Messege..." required="required"></textarea>
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
 
<%@ include file="footer.jsp" %>

<%@ include file="alljs.jsp" %>
<script>
// just for the demos, avoids form submit
jQuery.validator.setDefaults({
  debug: true,
  success: "valid"
});
$( "#myform" ).validate({
  rules: {
	  Choose: {
      required: true
    }
  }
});
</script>
</body>
</html>
