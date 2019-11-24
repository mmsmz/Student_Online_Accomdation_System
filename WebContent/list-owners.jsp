<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<title>Owners List</title>
<script src="js/exceljs.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<%@include file="navigation.jsp"%>
	<br>
	<p align="right">
		<button onclick="exportTableToExcel('tblData', 'list-owners')">Export
				To Excel</button>
	</p>
	<table class="table" id="tblData">
				<thead class="thead-light">
				
		
				<tr>
					<th>Owner Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Address</th>
					<th>Email</th>
					<th>Telephone</th>
					<th>Action</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="tempOwner" items="${OWNER_LIST}">
					<!-- set up a link for each owner -->
					<c:url var="tempLink" value="ownerControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="owner_id" value="${tempOwner.owner_id}" />
					</c:url>

					<!--  set up a link to delete a owner -->
					<c:url var="deleteLink" value="ownerControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="owner_id" value="${tempOwner.owner_id}" />
					</c:url>
					<tr>
						<td>${tempOwner.owner_id}</td>
						<td>${tempOwner.first_name}</td>
						<td>${tempOwner.last_name}</td>
						<td>${tempOwner.address}</td>
						<td>${tempOwner.email}</td>
						<td>${tempOwner.telephone}</td>
						<td><a href="${tempLink}" class="btn btn-primary btn-sm active">Update</a> | <a href="${deleteLink}" class="btn btn-danger btn-sm active"
							onclick="if (!(confirm('Are you sure you want to delete this owner?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
</div>
</body>
</html>

