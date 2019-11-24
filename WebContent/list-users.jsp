<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
<title>Users List</title>
<script src="js/exceljs.js"></script>
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
		<br>
		<p align="right">
			<button onclick="exportTableToExcel('tblData', 'list-users')">Export
				To Excel</button>
		</p>


		<table class="table" id="tblData">
			<thead class="thead-light">
				<tr>
					<th>User Id</th>
					<th>Username</th>
					<th>Password</th>
					<th>User Type</th>
					<th>Status</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tempUser" items="${USER_LIST}">

					<!--  set up a link to enable or disable user account -->
					<c:url var="deleteLink" value="userAccountControllerServlet">
						<c:param name="command" value="DISABLE" />
						<c:param name="user_id" value="${tempUser.user_id}" />
					</c:url>

					<tr>
						<td>${tempUser.user_id}</td>
						<td>${tempUser.username}</td>
						<td>${tempUser.password}</td>
						<td>${(tempUser.user_type)==1?'Owner':'Student'}</td>
						<td>${(tempUser.status)?'Enabled':'Disabled'}</td>
						<td><a href="${deleteLink}"
							class="btn btn-danger btn-sm active" role="button"
							aria-pressed="true"
							onclick="if (!(confirm('Are you sure you want to  ${!(tempUser.status)?'Enable':'Disable'} this User?'))) return false">${(tempUser.status)?'Disable':'Enable'}</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>
