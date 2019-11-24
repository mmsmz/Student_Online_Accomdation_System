<%@ taglib prefix="z" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>My Requests</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
	<%@include file="navigation.jsp" %>
	
	<form name="viewRequest" action="#" method="GET">
		<div id="container">
			<div id="content">
					<table class="table">
				<thead class="thead-light">
				<tr>
						<th>Request Id</th>
						<th>Requested Property</th>
						<th>Requested Date</th>
						<th>Date of view</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
					</thead>
					<tbody>
					<z:forEach var="tempList" items="${MYREQ_LIST}">
						<z:url var="deleteLink" value="studentControllerServlet">
							<z:param name="command" value="DEL" />
							<z:param name="request_id" value="${tempList.request_id}" />
							<z:param name="student_id" value="<%= String.valueOf(userId) %>" />
						</z:url>
						<tr>
							<td>${tempList.request_id}</td>
							<td>${tempList.requested_property}</td>
							<td>${tempList.requested_date}</td>
							<td>${tempList.date_of_view}</td>
							<td>${(tempList.status)?'Accepted':'Not Accepted'}</td>
							<td><a href="${deleteLink}" class="btn btn-danger" onclick="if (!(confirm('Are you sure you want to delete the request?'))) return false">Delete</a></td>
						</tr>
					</z:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	</div>
</body>
</html>

