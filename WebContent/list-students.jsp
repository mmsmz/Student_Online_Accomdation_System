<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Students List</title>
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
		<%
			response.setHeader("Cache-Control", "no-cache");
			response.setHeader("Pragma", "no-cache");
			response.setHeader("Expires", "0");
		%>
		<br>
		<p align="left">	<input type="button" value="Add-Student"
						onclick="window.location.href='add-student-form.jsp'; return false;"
						class="btn btn-secondary btn-lg">
						</p>
		<p align="right">
			<button onclick="exportTableToExcel('tblData', 'list-students')">Export
				To Excel</button>
		</p>

		<table class="table" id="tblData">
			<thead class="thead-light">
				<tr>
					<th>Student Id</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Address</th>
					<th>Email</th>
					<th>Telephone</th>
					<th>DOB</th>
					<th>Nationality</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="tempStudent" items="${STUDENT_LIST}">
					<!-- set up a link for each student -->
					<c:url var="tempLink" value="studentControllerServlet">
						<c:param name="command" value="LOAD" />
						<c:param name="student_id" value="${tempStudent.student_id}" />
					</c:url>

					<!--  set up a link to delete a student -->
					<c:url var="deleteLink" value="studentControllerServlet">
						<c:param name="command" value="DELETE" />
						<c:param name="student_id" value="${tempStudent.student_id}" />
					</c:url>
					<tr>
						<td>${tempStudent.student_id}</td>
						<td>${tempStudent.first_name}</td>
						<td>${tempStudent.last_name}</td>
						<td>${tempStudent.address}</td>
						<td>${tempStudent.email}</td>
						<td>${tempStudent.telephone}</td>
						<td>${tempStudent.dob}</td>
						<td>${tempStudent.nationality}</td>
						<td><a href="${tempLink}"
							class="btn btn-primary btn-sm active" role="button"
							aria-pressed="true">Update</a> | <a href="${deleteLink}"
							class="btn btn-danger btn-sm active" role="button"
							aria-pressed="true"
							onclick="if (!(confirm('Are you sure you want to delete this student?'))) return false">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js">
		
	</script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>

