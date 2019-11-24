<%@ taglib prefix="q" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>Properties</title>
<script src="js/exceljs.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

<style type="text/css">
.input-group.md-form.form-sm.form-1 input {
	border: 1px solid #bdbdbd;
	border-top-right-radius: 0.25rem;
	border-bottom-right-radius: 0.25rem;
}

.input-group.md-form.form-sm.form-2 input {
	border: 1px solid #bdbdbd;
	border-top-left-radius: 0.25rem;
	border-bottom-left-radius: 0.25rem;
}

.input-group.md-form.form-sm.form-2 input.red-border {
	border: 1px solid #ef9a9a;
}

.input-group.md-form.form-sm.form-2 input.lime-border {
	border: 1px solid #cddc39;
}

.input-group.md-form.form-sm.form-2 input.amber-border {
	border: 1px solid #ffca28;
}
</style>
</head>

<body>
	<div class="container">
	<%@include file="navigation.jsp"%>

	<form name="searchForm" action="propertyController" method="GET">
		<div class="input-group md-form form-sm form-1 pl-0">
			<div class="input-group-prepend">
				<span class="input-group-text purple lighten-3" id="basic-text1"><input
					type="text" name="search" class="form-control" value="${PARAMS}"
					placeholder="Search Properties">
					<button type="submit" value="search" class="btn btn-primary">Search
						...</button> 
						<br> <br> 
						<span>&nbsp;&nbsp;&nbsp;&nbsp; </span>
					<div class="custom-control custom-checkbox">
						<input type="checkbox" class="custom-control-input"
							id="customCheck" name="available" value="1"
							${(CH==1)?'checked':''}> <label
							class="custom-control-label" for="customCheck">Filter
							Available Properties</label>
					</div> </span>
					
					
			</div>
			
		</div>
<br>

	<p align="right">
			<%
			if (user_type == 3) {
		%>
		<button onclick="exportTableToExcel('tblData', 'list-properties')">Export
				To Excel</button>
		<%
			}
		%>
	</p>

		<div id="container">
			<div id="content">
				<table class="table" id="tblData">
					<thead class="thead-light">
						<tr>
							<th>Property Type</th>
							<th>Address</th>
							<th>Suitable For</th>
							<th>Availability</th>
							<th>Owner</th>
							<th>Currently Rented By</th>
							<th>Charge</th>
													<% if(user_type == 1) {%>
						<th>View Request</th>
						<% } %>
						</tr>
					</thead>
					<tbody>
						<q:forEach var="tempProperty" items="${PROPERTY_LIST}">

							<q:url var="tempLink" value="propertyController">
								<q:param name="command" value="LOAD" />
								<q:param name="property_id" value="${tempProperty.property_id}" />
							</q:url>
							<tr>
								<td>${tempProperty.property_type}</td>
								<td>${tempProperty.address}</td>
								<td>${tempProperty.suitable_for}</td>
								<td>${tempProperty.is_available}</td>
								<td>${tempProperty.owner}</td>
								<td>${tempProperty.rented_by}</td>
								<td>${tempProperty.charge}</td>
								<% if(user_type == 1) {%>
							<td> 
								<a href="${tempLink}" class="btn btn-secondary">View</a>	
							</td>
							<% } %>	
						</q:forEach>
					</tbody>
				</table>
			</div>
	

	
		</div>
	</form>
	</div>
	
</body>
</html>

