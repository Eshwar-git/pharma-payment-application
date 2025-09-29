<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View Orders</title>
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
</style>
</head>
<body>


<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/adminHomePage">Home</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/home">Logout</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>



	<div class="container">
		<h2>Orders Placed</h2>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Order Id</th>
					<th>Customer Name</th>
					<th>Patient Name</th>
					<th>Age</th>
					<th>Doctor Name</th>
					<th>Date Of Order</th>
					<th>Medicine and Quantity</th>
					<th>Update Status</th>

				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${order}">
					<tr>
						<td>${item.getOrderId()}</td>
						<td>${item.getCustomerName()}</td>
						<td>${item.getPatientName()}</td>
						<td>${item.getAge()}</td>
						<td>${item.getDoctorName()}</td>
						<td>${item.getDateOfOrder()}</td>
						<td><c:forEach items="${medicineList}" var="maps">
								<c:forEach items="${maps}" var="mapItem">
								${mapItem.key} ${mapItem.value} <br />
								</c:forEach>
							</c:forEach></td>
						<td><a href="updateStatus?orderId=${item.getOrderId()}"><input type="button"
			class="btn btn-success" value="Update Status"></input></a></td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</body>
</html>