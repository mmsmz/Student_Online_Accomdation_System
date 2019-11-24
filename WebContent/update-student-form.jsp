<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<title>Update Student</title>

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


	<h3>Student Profile</h3>

	
		
		<div class="signup-content">
			<div class="signup-form">
				<form action="studentControllerServlet" class="register-form-black" method="GET">
					<input type="hidden" name="command" value="UPDATE" /> 
					<input type="hidden" name="student_id" value="${THE_STUDENT.student_id}" />
<h4>Personal Information</h4>
					<div class="form-row">
						
						<div class="form-group">
							<div class="form-input">
								<label for="first_name" class="required">First name</label> <input
									type="text" name="first_name" class="form-control"
									value="${THE_STUDENT.first_name}" />
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Last name</label> <input
									type="text" name="last_name" class="form-control"
									value="${THE_STUDENT.last_name}" />
							</div>
							
							<div class="form-radio">
								<label for="gender" class="radio-label">Gender :</label>
								<div class="form-radio-item">
											<input type="radio" name="gender" id="male" ${(THE_STUDENT.gender=="Male")?'checked':''}> <label
										for="male">Male</label> <span class="check"></span>
								</div>
								<div class="form-radio-item">
									<input type="radio" name="gender" id="female" ${(THE_STUDENT.gender=="Female")?'checked':''}> <label
										for="female">Female</label> <span class="check"></span>
								</div>
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Home Address</label>
								<input type="textbox" name="address" class="form-control" rows="2" value="${THE_STUDENT.address}"></textarea>
								
							</div>
						</div>

						<!-- second column -->
						<div class="form-group">

							<div class="form-input">
								<label class="control-label" for="date">Date of Birth</label> <input
									class="form-control" name="date" placeholder="MM/DD/YYY"
									type="text" value="${THE_STUDENT.dob}" />
							</div>
							<div class="form-input">
								<label for="email" class="required">Email</label> <input
									type="text" name="email" class="form-control"
									placeholder="example@gmail.com" value="${THE_STUDENT.email}" />
							</div>
							<div class="form-input">
								<label for="phone_number" class="required">Phone number</label>
								<input type="text" name="telephone" class="form-control"
									placeholder="10 digit numbers" value="${THE_STUDENT.telephone}" />
							</div>


							<div class="form-input">
								<label for="nationality" class="required">Nationality</label> <input
									type="text" name="nationality" class="form-control" value="${THE_STUDENT.nationality}" />
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
									type="text" name="fathername" class="form-control" value="${THE_STUDENT.fathername}"/>
							</div>

							<div class="form-input">
								<label for="last_name" class="required">Mother name</label> <input
									type="text" name="last_name" class="form-control" value="${THE_STUDENT.mothername}" />
							</div>


							<div class="form-input">
								<label for="schoolattended" class="required">School
									Attended</label> <input type="text" name="schoolattended"
									class="form-control" value="${THE_STUDENT.schoolattended}" />
							</div>

							<div class="form-select">
								<div class="label-flex">
									<label for="medium">Medium</label>

								</div>
								<div class="select-list">
									<select name="medium" id="meal_preference" value="${THE_STUDENT.medium}">
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
									type="text" name="phone_number" class="form-control"
									placeholder="10 digit numbers" value="${THE_STUDENT.fathercontactno}" />
							</div>
							<div class="form-input">
								<label for="phone_number">Mother Phone number</label> <input
									type="text" name="phone_number" class="form-control"
									placeholder="10 digit numbers" value="${THE_STUDENT.mothercontactno}" />
							</div>
							<div class="form-input">
								<label for="phone_number" class="required">Emergency
									Contact No</label> <input type="text" name="phone_number"
									class="form-control" placeholder="10 digit numbers" value="${THE_STUDENT.emergencyno}" />
							</div>
							<div class="form-input">
								<label for="mediclecondition" class="required">Medical
									Condition</label> 
									<input type="text" name="mediclecondition" value="${THE_STUDENT.mediclecondition}" class="form-control" />
							</div>


						</div>




					</div>


					<div class="form-submit">
						<input type="submit" value="Submit"
							class="save btn btn-primary" id="submit" name="submit" />

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