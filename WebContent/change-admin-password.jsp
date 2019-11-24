<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to XYZ University's Accommodation Management Web
	Application</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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

	<%@include file="navigation.jsp"%>

	<div class="login-form">
	
		<form action="userAccountControllerServlet" method="GET">
			<input type="hidden" name="command" value="CHANGE_PW" />
			<h2 class="text-center">Change Password</h2>

			<h5 style="color: red">Updating a New Password</h5>

			<input type="hidden" name="user_id" value="<%=userId%>" required>

			<div class="form-group">
				<input id="password" name="password" class="form-control"
					type="password" pattern="^\S{4,}$"
					onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Must have at least 6 characters' : ''); if(this.checkValidity()) form.password_two.pattern = this.value;"
					placeholder="Password" required>
			</div>

			<div class="form-group">
				<input id="password_two" name="confirm_password"
					class="form-control" type="password" pattern="^\S{4,}$"
					onchange="this.setCustomValidity(this.validity.patternMismatch ? 'Please enter the same Password as above' : '');"
					placeholder="Verify Password" required>
			</div>

			<div class="form-group">
				<button type="submit" value="Password Updated"
					class="btn btn-primary btn-block">Password Updated</button>
			</div>
			<div class="clearfix"></div>
		</form>



		<div style="clear: both;"></div>
		<h5 style="color: red">${SUCCESS}</h5>
	</div>
	
</body>

</html>