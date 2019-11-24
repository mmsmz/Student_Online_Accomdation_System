<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 180px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #000080;
  overflow-x: hidden;
  padding-top: 20px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 25px;
  color: #FFDEAD;
  display: block;
}

.sidenav a:hover {
  color: #f1f1f1;
}

.main {
  margin-left: 160px; /* Same as the width of the sidenav */
  font-size: 28px; /* Increased text to enable scrolling */
  padding: 0px 10px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>

<script type="text/javaScript"> function disableBackButton(){window.history.forward();}setTimeout("disableBackButton()", 0); </script>
<%
	// This scriplet function will validate the logged user type
	int userId = 0;
	int user_type = 0;
	Cookie[] cookies = request.getCookies();
	if (cookies != null) {
		for (Cookie cookie : cookies) {
			if (cookie.getName().equals("user_id"))
				userId = Integer.parseInt(cookie.getValue());
			if (cookie.getName().equals("user_type"))
				user_type = Integer.parseInt(cookie.getValue());
		}
	}
	if (userId == 0)
		response.sendRedirect("userAccountControllerServlet");
%>

<div class="sidenav">
  
	<%
		if (user_type == 3) {
	%>
	<a href="propertyController">All Properties</a>
	<a href="userAccountControllerServlet?command=LIST">Manage User Accounts</a>
	<a href="studentControllerServlet?command=LIST">Manage Students</a>
	<a href="ownerControllerServlet?command=LIST">Manage Owners</a>
	<a href="userAccountControllerServlet?command=CHANGEA">Change Password</a>  
	<a href="userAccountControllerServlet?command=LOGOUT">Logout</a>
	<%
		} else if (user_type == 2) {
	%>
	<a href="ownerControllerServlet?command=PROFILE&owner_id=<%=userId%>"> My Profile </a>
	<a href="propertyController">All Properties </a>  
	<a href="propertyController?command=MYLIST&owner_id=<%=userId%>">My Properties </a> 
	<a href="viewRequestController?command=LIST&owner_id=<%=userId%>">View Request</a> 
	<a href="userAccountControllerServlet?command=CHANGEO">Change Password</a> 
	<a href="userAccountControllerServlet?command=LOGOUT">Logout</a>
	<%
		} else if (user_type == 1) {
	%>
	<a href="studentControllerServlet?command=PROFILE&student_id=<%=userId%>">My Profile </a> 
	<a href="propertyController">Properties</a> 
	<a href="viewRequestController?command=MYLIST&student_id=<%=userId%>">My View Requests </a> 
	<a href="userAccountControllerServlet?command=CHANGE">Change Password</a> 
	<a href="userAccountControllerServlet?command=LOGOUT">Logout</a>
	<%
		}
	%>
</div>