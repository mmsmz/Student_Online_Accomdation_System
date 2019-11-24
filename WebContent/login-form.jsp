<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<meta http-equiv="Pragma" content="no-cache"> 
<meta http-equiv="Expires" content="-1"> 
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate"> 
<head>
<title>Welcome to XYZ University's Accommodation Management Web
	Application</title>
	
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<style type="text/css">
	.login-form {
		width: 340px;
    	margin: 50px auto;
	}
    .login-form form {
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .btn {        
        font-size: 15px;
        font-weight: bold;
    }
</style>
</head>

<body>
<%
	 response.setHeader("Cache-Control", "no-cache");
	 response.setHeader("Pragma", "no-cache");
	 response.setHeader("Expires" ,"0");
	 Cookie userIdCookie = new Cookie("user_id", null);
	 Cookie userTypeCookie = new Cookie("user_type", null);
	 userIdCookie.setMaxAge(0);
	 userTypeCookie.setMaxAge(0);
	 userIdCookie.setPath("/");
	 userTypeCookie.setPath("/");
     response.addCookie(userIdCookie);
     response.addCookie(userTypeCookie);
%>

	<div id="wrapper">
		<div id="header" align="center">
			<img src="img/XYZ.png" class="img-fluid" alt="Responsive image">
			<h1>Accommodation Management System</h1>
		</div>
	</div>
	<h5 align="center" style="color: red"><%=(request.getAttribute("errMessage") == null) ? "" : "Successfully account registered"%></h5>	

<div class="login-form">
  <form action="userAccountControllerServlet" method="POST">
	<input type="hidden" name="command" value="LOGIN" />
        <h2 class="text-center">Log in</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Username" name="username" required="required">
        </div>
        <div class="form-group">
            <input type="password" class="form-control" placeholder="Password" name="password" required="required">
        </div>
        <div class="form-group">
            <button type="submit" value="Sign-in" class="btn btn-primary btn-block">Log in</button>
        </div>
        <div class="clearfix">
            <label class="pull-left checkbox-inline"><input type="checkbox"> Remember me</label>
            <a href="#" class="pull-right">Forgot Password?</a>
        </div>        
    </form>
    <p class="text-center"><input type="button" value="Property Registery" class="btn btn-primary btn-block" onclick="location.href='userAccountControllerServlet?command=SIGNUP';"/></p>
</div>
<h5 style="color: red" align="center">${Message}</h5>
</body>
</html>