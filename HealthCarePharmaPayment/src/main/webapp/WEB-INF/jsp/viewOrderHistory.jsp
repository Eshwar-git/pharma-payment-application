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
	<div class="container">
		<h2>Orders Placed</h2>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Order Id</th>
					<th>Patient Name</th>
					<th>Age</th>
					<th>Doctor Name</th>
					<th>Date Of Order</th>
					<th>Medicine and Quantity</th>
					<th>Order Status</th>

				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${order}">
					<tr>
						<td>${item.getOrderId()}</td>
						<td>${item.getPatientName()}</td>
						<td>${item.getAge()}</td>
						<td>${item.getDoctorName()}</td>
						<td>${item.getDateOfOrder()}</td>
						<td><c:forEach items="${medicineList}" var="maps">
								<c:forEach items="${maps}" var="mapItem">
								${mapItem.key} ${mapItem.value} <br />
								</c:forEach>
							</c:forEach></td>
						<td>${item.getOrderStatus()}</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/customerHomePage?customerName=${customerName}"><input
			type="button" class="btn btn-primary" value="Back"></input></a>
	</div>
</body>
</html>