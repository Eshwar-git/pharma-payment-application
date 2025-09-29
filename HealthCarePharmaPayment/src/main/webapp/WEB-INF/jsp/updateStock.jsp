<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Update Stock</title>
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
	<h4 style="color: red">${message}</h4>
		<h2>Available Stock</h2>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Medicine Id</th>
					<th>Medicine Name</th>
					<th>Stock</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${medicineDetails}">
					<tr>
						<td>${item.getMedicineId()}</td>
						<td>${item.getMedicineName()}</td>
						<td>${item.getStock()}</td>
						<td><a href="/editStock?medicineName=${item.getMedicineName()}"><button class="btn btn-warning"
								type="submit" value="Edit">Edit</button></a>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/adminHomePage"><input type="button"
			class="btn btn-primary" value="Back"></input></a>
	</div>
</body>
</html>