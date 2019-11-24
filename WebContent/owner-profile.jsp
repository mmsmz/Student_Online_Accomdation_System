<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>${OWNER.first_name}'sDetails</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
	<%@include file="navigation.jsp"%>
	
	<div class="row panel panel-success" style="margin-top: 1%;">
		<div class="panel-heading lead">
			<div class="row">
				<div class="col-lg-8 col-md-8">
					<i class="fa fa-users"></i> View ${OWNER.first_name}'s Details
				</div>
			</div>
		</div>

		<form action="ownerControllerServlet" method="GET">
			<div class="panel-body">
				<div class="row">
					<div class="col-lg-12 col-md-12">
						<div class="row">
							<div class="col-lg-9 col-md-9">
								<ul class="nav nav-tabs">

									<li class="active"><a data-toggle="tab" href="#Summery"
										class="text-success"><i class="fa fa-indent"></i> Summery</a></li>
									<li><a data-toggle="tab" href="#Contact"
										class="text-success"><i class="fa fa-bookmark-o"></i>
											Contact Info</a></li>
									<li><a data-toggle="tab" href="#Address"
										class="text-success"><i class="fa fa-home"></i> Address</a></li>
								</ul>

								<div class="tab-content">
									<div id="Summery" class="tab-pane fade in active">

										<input type="hidden" name="command" value="LOAD" /> <input
											type="hidden" name="owner_id" value="${OWNER.owner_id}" />

										<div class="table-responsive panel">
											<table class="table">
												<tbody>
													<tr>
														<td class="text-success"><i class="fa fa-user"></i>
															First Name :</td>
														<td>${OWNER.first_name}</td>
													</tr>
													<tr>
														<td class="text-success"><i class="fa fa-list-ol"></i>
															Last Name :</td>
														<td>${OWNER.last_name}</td>
													</tr>


												</tbody>
											</table>
										</div>
									</div>

									<div id="Address" class="tab-pane fade">
										<div class="table-responsive panel">
											<table class="table">
												<tbody>
													<tr>
														<td class="text-success"><i class="fa fa-home"></i>
															Address</td>
														<td>
															<address>
																<strong>${OWNER.address}</strong>
															</address>
														</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
									<div id="Contact" class="tab-pane fade">
										<div class="table-responsive panel">
											<table class="table">
												<tbody>

													<tr>
														<td class="text-success"><i class="fa fa-envelope-o"></i>
															Email ID</td>
														<td><a
															href="mailto:****@pawanmall.net?subject=Email from &amp;body=Hello, Viddhyut Mall">${OWNER.email}</a></td>
													</tr>
													<tr>
														<td class="text-success"><i
															class="glyphicon glyphicon-phone"></i> Mobile Number</td>
														<td>${OWNER.telephone}</td>
													</tr>
													<tr>
														<td class="text-success"><i class="fa fa-flag"></i>
															Nationality</td>
														<td>${OWNER.nationality}</td>
													</tr>
												</tbody>
											</table>
										</div>
									</div>
				<input type="hidden" name="user_id" value="<%=request.getSession().getAttribute("user_id")%>" />
				<button type="submit" value="Update Profile" class="btn btn-primary btn-block">Update Profile</button>

								</div>

							</div>

						</div>
					</div>
				</div>

			
			</div>
		</form>
	</div>
</div>
</body>
</html>