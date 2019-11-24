<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<title>Add Owner</title>
<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<!-- Main css -->
<link rel="stylesheet" href="css/regs_style.css">

<!--  Bootstrap-->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">


</head>

<body>
	<div class="container">
	<%@include file="navigation.jsp"%>

	
		<h3>Registering Owner</h3>
		<div class="signup-content">

			<div class="signup-form">
				<form action="ownerControllerServlet" class="register-form-black"
					method="GET">
					<input type="hidden" name="command" value="ADD" />
					<div class="form-row">
						<h4>Personal Information</h4>
						<div class="form-group">

							<div class="form-input">
								<label for="first_name" class="required">First name</label> <input
									type="text" name="firstName" class="form-control" />
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Last name</label> <input
									type="text" name="lastName" class="form-control" />
							</div>
							<div class="form-input">
								<label for="nic" class="required">NIC</label> <input type="text"
									name="nic" class="form-control" placeholder="NIC" />
							</div>






						</div>

						<!-- second column -->
						<div class="form-group">

							<div class="form-input">
								<label for="email" class="required">Email</label> <input
									type="text" name="email" class="form-control"
									placeholder="example@gmail.com" />
							</div>
							<div class="form-input">
								<label for="phone_number" class="required">Phone number</label>
								<input type="text" name="telephone" class="form-control"
									placeholder="10 digit numbers" />
							</div>
							<div class="form-input">
								<label for="last_name" class="required">Home Address</label>
								<textarea name="address" class="form-control"
									id="exampleFormControlTextarea1" rows="2"></textarea>
							</div>
						</div>
					</div>
					<br>
					<div class="form-submit">
						<input type="submit" value="Submit"
							class="save btn btn-primary btn-block" id="submit" name="submit" />
					</div>
				</form>
				<div style="clear: both;"></div>
			</div>
		</div>
	 	 <p>
			<a href="ownerControllerServlet">Back to List</a>
		</p>
	</div>



	<!-- JS -->
	<script src="vendor/jquery.min.js"></script>
	<script src="vendor/nouislider.min.js"></script>
	<script src="vendor/jquery.validate.min.js"></script>
	<script src="vendor/additional-methods.min.js"></script>
	<script src="vendor/wNumb.js"></script>
	<script src="js/main.js"></script>
</body>

</html>