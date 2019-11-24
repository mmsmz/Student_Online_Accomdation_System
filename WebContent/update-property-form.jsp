<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Property Details</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>

<body>
<div class="container">
	<%@include file="navigation.jsp"%>
	
		<h3>Property Details</h3>

		<form action="viewRequestController" method="GET">
			<input type="hidden" name="command" value="VIEW" /> 
				<div id="container">
			<div id="content">
				
			<table class="table">
				<tbody>
					<tr>					
						<td><label>Property Type: </label></td>
						<td><label> ${PROPERTY.property_type} </label></td>
						<td><input type="hidden" name="property_id" value="${PROPERTY.property_id}" /></td>
					</tr>

					<tr>
						<td><label>Address: </label></td>
						<td><label>${PROPERTY.address}</label></td>
					</tr>

					<tr>
						<td><label>Suitable For: </label></td>
						<td><label>${PROPERTY.suitable_for}</label></td>
					</tr>

					<tr>
						<td><label>Availability : </label></td>
						<td><label>${PROPERTY.is_available}</label></td>
					</tr>

					<tr>
						<td><label>Owner: </label></td>
						<td><label>${PROPERTY.owner}</label></td>
					</tr>

					<tr>
						<td><label>Rented By : </label></td>
						<td><label>${PROPERTY.rented_by}</label></td>
						<td><input type="hidden" name="user_id" value="<%=userId%>" /></td>
					</tr>

					<tr>
						<td><label>Charge : </label></td>
						<td><label>${PROPERTY.charge}</label></td>
					</tr>

					<tr>
						<td><label>Date of View:</label></td>
						<td><input type="date" name="date_of_view" id="today" class="form-control" required/></td>
						<td><input type="hidden" name="student_id" value="<%=userId%>"/></td>
					</tr>
					
					<tr>
						<td align="left"><a href="propertyController" class="btn btn-secondary">Go Back to the Property List</a></td>
						<td align="right"><input type="submit" value="Send Request" class="btn btn-primary" /></td>
						
					</tr>
				</tbody>
			</table>
			</div></div>
		</form>

		<div style="clear: both;"></div>

		
	</div>
</body>
</html>