<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Travel Admin - Login</title>
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/datepicker3.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
</head>
<body>
	<div class="row">
		<div class="col-xs-10 col-xs-offset-1 col-sm-8 col-sm-offset-2 col-md-4 col-md-offset-4">
				
				<img src="img/travel logo.png"  alt="Travel Admin"  height="200" width="210" style="margin-left: 23%;margin-bottom: 5%"/>
				
			<div class="login-panel panel panel-default">
				<div class="panel-heading">Log in</div>
					
				<div class="panel-body">
					<form action="Login" method="post" role="form">
						<fieldset>
							<div class="form-group">
								<input class="form-control" placeholder="Username" name="username" type="text" autofocus="">
							    <input name="msg" id="msg" type="hidden" value="<%=(request.getAttribute("msg")!=null)?request.getAttribute("msg"):""%>">
							</div>
							<div class="form-group">
								<input class="form-control" placeholder="Password" name="password" type="password" value="">
							</div>
							<button type="submit" class="btn btn-primary mt-2">Log In</button></fieldset>
								<p class="text-center"><font color="red"><%=(request.getAttribute("msg")!=null)?request.getAttribute("msg"):""%></font></p>
					</form>
					<p class="text-center text-muted mt-3 mb-3">&copy; Copyright 2025 All Rights Reserved <br>Travel.</p>
				</div>
			</div>
		</div><!-- /.col-->
	</div><!-- /.row -->	
	
<%@include file="alljs.jsp" %>
<script type="text/javascript">
		$(function()
		{
		 	$("#username").focus();
		});
		</script>
</body>
</html>
