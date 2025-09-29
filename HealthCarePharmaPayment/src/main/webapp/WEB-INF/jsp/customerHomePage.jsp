<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Customer Home Page</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style>
body {
	background-color: lavender;
	margin: auto;
}

header {
	height: 72px;
}
</style>
</head>

<body>

	<nav class="navbar navbar-default" role="navigation">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-ex1-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="/customerHomePage?customerName=${customerName}">Home</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse navbar-ex1-collapse">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown">Sort Based On <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="/sortBasedOn?type=medicineName&customerName=${customerName}">Medicine Name</a></li>
						<li><a href="/sortBasedOn?type=manufacturer&customerName=${customerName}">Brand</a></li>
						<li><a href="/sortBasedOn?type=mrp&customerName=${customerName}">Price</a></li>
						<li><a href="/sortBasedOn?type=type&customerName=${customerName}">Type</a></li>
						<li><a href="/sortBasedOn?type=disease&customerName=${customerName}">Disease</a></li>
					</ul></li>
			</ul>
			
			<ul class="nav navbar-nav navbar-right">
				<li><a href="/viewOrderHistory?customerName=${customerName}">Order
						History</a></li>
				<li><a href="/help?customerName=${customerName}">Help</a></li>
				<li><a href="/viewRaisedTicket?customerName=${customerName}">Raised
						Tickets</a></li>
				<li><a href="/home">Logout</a></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</nav>



	<div class="container">
		<h2>Available Medicine</h2>
		<input id="myInput" type="text" placeholder="Search Medicines">
		<br> <br>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Medicine Name</th>
					<th>Manufacturer</th>
					<th>Quantity Per Strip</th>
					<th>MRP</th>
					<th>Expiry Date</th>
					<th>Type</th>
					<th>Disease</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${medicineDetails}">
					<tr>
						<td>${item.getMedicineName()}</td>
						<td>${item.getManufacturer()}</td>
						<td>${item.getQuantityPerStrip()}</td>
						<td>${item.getMrp()}</td>
						<td>${item.getExpiryDate()}</td>
						<td>${item.getType()}</td>
						<td>${item.getDisease()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/orderPage?customerName=${customerName}"><input
			type="button" class="btn btn-success" value="Order"></input></a>
	</div>
	<script>
		$(document)
				.ready(
						function() {
							$("#myInput")
									.on(
											"keyup",
											function() {
												var value = $(this).val()
														.toLowerCase();
												$("#myTable tr")
														.filter(
																function() {
																	$(this)
																			.toggle(
																					$(
																							this)
																							.text()
																							.toLowerCase()
																							.indexOf(
																									value) > -1)
																});
											});
						});
	</script>
</body>
</html>