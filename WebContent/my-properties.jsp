<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>Properties</title>
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

	<!-- conditional display field -->
	<form name="command">
		<input type="button" value="Add Property"
			onclick="window.location.href='add-property.jsp'; return false;"
			class="btn btn-secondary btn-lg">
	</form>
<br>
	<form name="searchForm" action="propertyController" method="GET">
		<!-- 		<input type="text" name="search" class="form-control"
			placeholder="Search Properties">
		<button type="submit" value="search" class="add-student-button">Search</button> -->
		<div id="container">
			<div id="content">
				<table class="table">
				<thead class="thead-light">
					<tr>
						<th>Property Type</th>
						<th>Address</th>
						<th>Suitable For</th>
						<th>Availability</th>
						<th>Currently Rented By</th>
						<th>Charge</th>
						<th>Payment</th>
						<th>Update</th>
						<th>Delete</th>
					</tr>
					</thead>
					<tbody>
					
					<q:forEach var="tempProperty" items="${PROPERTY}">

						<q:url var="tempLink" value="propertyController">
							<q:param name="command" value="PAY" />
							<q:param name="property_id" value="${tempProperty.property_id}" />
							<q:param name="owner_id" value="${tempProperty.owner_id}" />
						</q:url>
						
						<q:url var="updateLink" value="propertyController">
							<q:param name="command" value="UPDATE" />
							<q:param name="property_id" value="${tempProperty.property_id}" />
							<q:param name="owner_id" value="${tempProperty.owner_id}" />							
						</q:url>
						
						<q:url var="deleteLink" value="propertyController">
							<q:param name="command" value="DELETE" />
							<q:param name="property_id" value="${tempProperty.property_id}" />
							<q:param name="owner_id" value="${tempProperty.owner_id}" />							
						</q:url>
						<tr>
							<td>${tempProperty.property_type}</td>
							<td>${tempProperty.address}</td>
							<td>${tempProperty.suitable_for}</td>
							<td>${tempProperty.is_available}</td>
							<td>${tempProperty.rented_by}</td>
							<td>${tempProperty.charge}</td>
							<td><a href="${tempLink}" class="btn btn-success" onclick="if (!(confirm('${(tempProperty.status)?'Already Paid, Cannot pay again':'Are you sure you want to make payment now?'}'))) return false">${(tempProperty.status)?'Paid':'Pay Now'}</a></td>
							<td><a href="${updateLink}" class="btn btn-primary">Update</a></td>
							<td><a href="${deleteLink}" class="btn btn-danger" onclick="if (!(confirm('Are you sure you want to delete this property?'))) return false">Delete</a></td>
						</tr>
					</q:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	</div>
</body>
</html>

