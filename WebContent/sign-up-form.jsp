<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to XYZ University's Accommodation Management Web Application</title>
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
	<div id="wrapper">
		<div id="header" align="center">
			<img src="img/XYZ.png" class="img-fluid" alt="Responsive image">
			<h1>Accommodation Management System</h1>
		</div>
	</div>
	
	<div class="login-form">
		<h3>Owners Get Registered Here!!</h3>
		<h5 style="color:red">Please fill up following details to create an account for you!!</h5>

<form action="userAccountControllerServlet?command=REGISTER" method="POST">
	<input type="hidden" name="command" value="REGISTER" />
        <h2 class="text-center">Signup Now</h2>       
        <div class="form-group">
            <input type="text" class="form-control" placeholder="Username" name="username" required="required">
        </div>
        <div class="form-group">
		<input id="password" class="form-control" name="password" type="password" pattern="^\S{4,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;" placeholder="Password" required>
        </div>
        
        <div class="form-group">
		<input id="password_two" class="form-control" name="confirm_password" type="password" pattern="^\S{4,}$" onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');" placeholder="Verify Password" required>
        </div>

       <input name="account-type" type="hidden" value ="2" >

        <div class="form-group">
            <button type="submit" value="Sign-up" class="btn btn-primary btn-block">Registered</button>
        </div>
        <div class="clearfix">
          </div>        


    </form>
</div>
</body>

</html>