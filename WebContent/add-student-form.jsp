<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Student</title>

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

		<h3>Registering Student</h3>

		<div class="signup-content">

			<div class="signup-form">

				<form action="studentControllerServlet" class="register-form-black"
					method="GET">
					<h4>Personal Information</h4>
					<input type="hidden" name="command" value="ADD" />
					<div class="form-row">
						<div class="form-group">

							<div class="form-input">
								<label for="first_name" class="required">First name</label> <input
									type="text" name="firstName" class="form-control" />
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Last name</label> <input
									type="text" name="lastName" class="form-control" />
							</div>
							<div class="form-radio">
								<label for="gender" class="radio-label">Gender :</label>
								<div class="form-radio-item">
									<input type="radio" name="gender" id="male" checked> <label
										for="male">Male</label> <span class="check"></span>
								</div>
								<div class="form-radio-item">
									<input type="radio" name="gender" id="female"> <label
										for="female">Female</label> <span class="check"></span>
								</div>
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Home Address</label>
								<textarea name="address" class="form-control"
									id="exampleFormControlTextarea1" rows="2"></textarea>
							</div>
						</div>

						<!-- second column -->
						<div class="form-group">

							<div class="form-input">
								<label class="control-label" for="date">Date of Birth</label> <input
									class="form-control" name="dob" placeholder="MM/DD/YYY"
									type="text" />
							</div>
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
								<label for="nationality" class="required">Nationality</label> <input
									type="text" name="nationality" class="form-control" />
							</div>

						</div>

					</div>
					<br>

					<h4>General Information</h4>
					<!-- 2 row-->
					<div class="form-row">

						<div class="form-group">

							<div class="form-input">
								<label for="fathername" class="required">Father name</label> <input
									type="text" name="fathername" class="form-control" />
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Mother name</label> <input
									type="text" name="mothername" class="form-control" />
							</div>


							<div class="form-input">
								<label for="schoolattended" class="required">School
									Attended</label> <input type="text" name="schoolattended"
									class="form-control" />
							</div>

							<div class="form-select">
								<div class="label-flex">
									<label for="medium">Medium</label>

								</div>
								<div class="select-list">
									<select name="medium" id="meal_preference" name="medium">
										<option value="English">English</option>
										<option value="French">French</option>
										<option value="Spanish">Spanish</option>
									</select>
								</div>
							</div>

						</div>

						<!-- second column -->
						<div class="form-group">
							<div class="form-input">
								<label for="phone_number">Father Phone number</label> <input
									type="text" name="fathercontactno" class="form-control"
									placeholder="10 digit numbers" />
							</div>
							<div class="form-input">
								<label for="phone_number">Mother Phone number</label> <input
									type="text" name="mothercontactno" class="form-control"
									placeholder="10 digit numbers" />
							</div>
							<div class="form-input">
								<label for="phone_number" class="required">Emergency
									Contact No</label> <input type="text" name="emergencyno"
									class="form-control" placeholder="10 digit numbers" />
							</div>
							<div class="form-input">
								<label for="mediclecondition" class="required">Medical
									Condition</label> <input type="text" name="mediclecondition"
									class="form-control" />
							</div>


						</div>




					</div>


					<div class="form-submit">
						<input type="submit" value="Submit"
							class="save btn btn-primary btn-block" id="submit" name="submit" />

					</div>
				</form>
				<div style="clear: both;"></div>


			</div>
		</div>

	</div>




	<!-- JS -->
	<script src="vendor/jquery.min.js"></script>
	<script src="vendor/nouislider.min.js"></script>
	<script src="vendor/jquery.validate.min.js"></script>
	<script src="vendor/wNumb.js"></script>
	<script src="vendor/additional-methods.min.js"></script>
	<script src="js/main.js"></script>
</body>

</html>