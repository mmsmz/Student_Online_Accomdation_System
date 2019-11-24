<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<title>View Requests</title>

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

	<form name="viewRequestForm" action="propertyController" method="GET">
		<div id="container">
			<div id="content">
				<table class="table">
					<thead class="thead-light">
						<tr>
							<th>Request Id</th>
							<th>Requested by</th>
							<th>Requested Property</th>
							<th>Requested Date</th>
							<th>Date of view</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="Request" items="${REQ_LIST}">
							<c:url var="tempLink" value="viewRequestController">
								<c:param name="command" value="ACCEPT" />
								<c:param name="request_id" value="${Request.request_id}" />
								<c:param name="owner_id" value="${Request.owner_id}" />
							</c:url>
							<tr>
								<td>${Request.request_id}</td>
								<td>${Request.requested_by}</td>
								<td>${Request.requested_property}</td>
								<td>${Request.requested_date}</td>
								<td>${Request.date_of_view}</td>
								<td>${(Request.status)?'Accepted':'Not Accepted'}</td>
								<td><a href="${tempLink}" class="btn btn-warning"
									onclick="if (!(confirm('${(Request.status)?'Are you sure you want to reject the request?':'Are you sure you want accept the request?'}'))) return false">${(Request.status)?'Reject':'Accept'}</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	</div>
</body>
</html>

