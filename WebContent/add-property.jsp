<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Property</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

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
		<h3>Registering Your Property</h3>
	<div class="signup-content">

			<div class="signup-form">

		<form action="propertyController" class="register-form-black"
			method="GET">
			<input type="hidden" name="command" value="ADD" /> <br>
			<br>
			<br>
			<div class="form-row">
				<div class="form-group">
					<div class="form-select">
						<div class="label-flex">
							<label for="types">Types of Property</label>
						</div>
						<div class="select-list">
							<select name="property_type"  class="browser-default custom-select">
								<option value="1">Single Room</option>
								<option value="2">Double Room</option>
								<option value="3">Annex</option>
								<option value="4">Studio Flat</option>
								<option value="5">House</option>
								<option value="6">Apartment</option>
								<option value="7">Villa</option>
								<option value="8">Bungalow</option>
							</select>
						</div>
					</div>
					<div class="form-input">
						<label for="address" class="required">Address</label>
						<textarea name="address" class="form-control"
							id="exampleFormControlTextarea1" rows="2"></textarea>
					</div>
					<div class="form-input">
						<label for="suitable_for" class="required">No. of Tanents</label>										
						<input type="text" name="suitable" class="form-control" placeholder="Max 60"/>
						<input type="hidden" name="is_available" value="1" />
						<input type="hidden" name="owner_id" value="<%=userId%>" />
						<input type="hidden" name="rented_by" value="0" />
					</div>
					<div class="form-input">
						<label for="payment" class="required">Payment</label> <input
							type="text" name="charge" class="form-control" />
					</div>
					
				</div>
			</div>
			<div class="form-submit">
				<table>
				<tbody>
				<tr>
				<td align="left">
				
				<a href= "propertyController?command=MYLIST&owner_id=<%=userId%>" class="btn btn-success">Back
				to List</a>
				</td>
				<td align="right">
				<input type="submit" value="Save" class="btn btn-primary"/></td>
				</tr>
				</tbody>
				</table>
			</div>
		</form>
		<div style="clear: both;"></div>
	
	</div>
	</div></div>
	
	<!-- JS -->
	<script src="vendor/jquery.min.js"></script>
	<script src="vendor/nouislider.min.js"></script>
	<script src="vendor/wNumb.js"></script>
	<script src="vendor/jquery.validate.min.js"></script>
	<script src="vendor/additional-methods.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>


