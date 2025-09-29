<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Status</title>
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
	<h3>Update Order Status</h3>
	<h4 style="color: green">${message}</h4>
	<div class="Container">
		<form action="saveUpdatedStatus" method="POST">
			<div class="form-group">
				<label for="userName">Order Id</label> <input type="text"
					class="form-control" name="orderId" value="${orderId}" required>
			</div>
			<div class="form-group">
				<label for="status" name="status">Status</label> 
				<select class="form-control" id="sel1" name="status">
					<option name="status" value="Ordered">Ordered</option>
					<option name="status" value="Shipped">Shipped</option>
					<option name="status" value="Out For Delivery">Out For Delivery</option>		
					<option name="status" value="Delivered">Delivered</option>		
				</select>			
			</div>
			<button type="submit" class="btn btn-primary">Update</button>
			<a href="/viewOrder"><input type="button"
			class="btn btn-success" value="Back"></input></a>
		</form>
	
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
