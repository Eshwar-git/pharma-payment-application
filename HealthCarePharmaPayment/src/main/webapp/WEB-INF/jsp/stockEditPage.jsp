<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Stock Details</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
body {
	width: 50%;
	background-color: lavender;
	margin: auto;
	margin-top: 7em;
}

.Container {
	padding: 2em;
	background-color: #FFFAFA;
}
</style>
</head>
<body>
	<h3>Edit Stock</h3>
	<div class="Container">
		<form action="saveEditedStock" method="POST">
			<div class="form-group">
				<label for="userName">Medicine Name</label> <input type="text"
					class="form-control" name="medicineName" value="${medicineName}"
					required>
			</div>
			<div class="form-group">
				<label for="userName">Stock</label> <input type="text"
					class="form-control" name="stock" value="${stock}" required>
			</div>
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
		<form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
