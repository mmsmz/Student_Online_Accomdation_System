<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Owners Profile</title>

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

	<div id="container">
		<h3>Update ${THE_OWNER.first_name}'s Profile</h3>

		<form action="ownerControllerServlet" method="GET">
			<input type="hidden" name="command" value="UPDATE" /> <input
				type="hidden" name="owner_id" value="${THE_OWNER.owner_id}" />
				
			<table class="table">
				
					<tr>
						<td><label>First name:</label></td>
						<td><input type="text" name="first_name"
							value="${THE_OWNER.first_name}" /></td>
					</tr>
					<tr>
						<td><label>Last name:</label></td>
						<td><input type="text" name="last_name"
							value="${THE_OWNER.last_name}" /></td>
					</tr>
					<tr>
						<td><label>Address:</label></td>
						<td><input type="text" name="address"
							value="${THE_OWNER.address}" /></td>
					</tr>
					<tr>
						<td><label>Email:</label></td>
						<td><input type="text" name="email"
							value="${THE_OWNER.email}" /></td>
					</tr>
					<tr>
						<td><label>Telephone:</label></td>
						<td><input type="text" name="telephone"
							value="${THE_OWNER.telephone}" /></td>
					</tr>
						<tr>
						<td><label>Nationality:</label></td>
						<td><input type="text" name="nationality"
							value="${THE_OWNER.nationality}" /></td>
					</tr>

					<tr>
						<td><label></label></td>
						<td><input type="submit" value="Save" class="save" /></td>
					</tr>

				</tbody>
			</table>
		</form>

		<div style="clear: both;"></div>
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