<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Page</title>
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
	width: 40%;
	margin: auto;
	
}

.Container {
	padding: 1em;
	background-color: #F5F5DC;
}
.header {
	padding: 20px;
	background: #1abc9c;
	color: white;
	font-size: 30px;
	margin: auto;
}
</style>
</head>
<body>
	<h3>Add Required Medicines</h3>
	<div>
		<form:form class="Container" modelAttribute="orderedMedicine" action="/saveAddedMedicines" method="GET">
		<div class="form-group">
				<label>Order Id <p>(Don't alter orderId)</p></label><br> <form:input class="form-control" value="${orderId}"
					type="number" path="orderId" required="required" />
		</div>
			<div class="form-group">
				<label>Medicines</label><br> 
				<form:select class="form-control" path="medicine" items="${medicineList}"
							id="medicines"/>
			</div>
			<div class="form-group">
				<label>Quantity</label><br> <form:input class="form-control"
					type="number" path="quantity" required="required" />
			</div>
				
			<button type="submit" class="btn btn-success">Save</button>
			<a href="/viewCart?orderId=${orderId}"><input type="button" class="btn btn-primary" value="Cart"></input></a>
		</form:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>