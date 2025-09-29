<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Medicine Information</title>
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
	<div class="container" >
		<h2>Available Medicine</h2>
		<h4 style="color:green">${message}</h4>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Medicine Id</th>
					<th>Medicine Name</th>
					<th>Manufacturer</th>
					<th>Quantity Per Strip</th>
					<th>MRP</th>
					<th>Manufacturing Date</th>
					<th>Expiry Date</th>
					<th>Type</th>
					<th>Disease</th>
					<th>Stock</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${medicineDetails}">
					<tr>
						<td>${item.getMedicineId()}</td>
						<td>${item.getMedicineName()}</td>
						<td>${item.getManufacturer()}</td>
						<td>${item.getQuantityPerStrip()}</td>
						<td>${item.getMrp()}</td>
						<td>${item.getManufacturingDate()}</td>
						<td>${item.getExpiryDate()}</td>
						<td>${item.getType()}</td>
						<td>${item.getDisease()}</td>
						<td>${item.getStock()}</td>
						<td><a href="/editMedicineInformation?medicineId=${item.getMedicineId()}"><input type="button"
			class="btn btn-warning" value="Edit"></input></a></td>
						<td><a href="/removeMedicineInformation?medicineId=${item.getMedicineId()}"><input type="button"
			class="btn btn-danger" value="Remove"></input></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/addNewMedicine"><input type="button"
			class="btn btn-success" value="Add"></input></a>
			<a href="/adminHomePage"><input type="button"
			class="btn btn-primary" value="Back"></input></a>
	</div>
</body>
</html>