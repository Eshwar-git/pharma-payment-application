<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Help Page</title>
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
	background-color: lavender;
	padding-top:7em;
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
	<h3>Raise Ticket</h3>
	<div>
		<form:form class="Container" modelAttribute="help" name="form1" action="/saveRaisedTicket" method="GET">
		<h4 style="color:green">${message}</h4>
			<div class="form-group">
				<label>Name</label><br> <form:input class="form-control"
					type="text" path="customerName" value="${customerName}" id="fname" required="required" />
			</div>
			<div class="form-group">
				<label>Issue</label><br> <form:input class="form-control"
					type="text" path="issue" id="fname" required="required" />
			</div>
			<div class="form-group">
				<label>Description</label><br> <form:textarea class="form-control"
					type="text" path="description" id="lname" required="required" />
			</div>
			<div class="form-group">
				<label>Date of Issue</label><br> <form:input class="form-control"
					type="type" path="dateOfIssue" value="${date}"  id="age" required="required" />
			</div>
			
			<button type="submit" class="btn btn-success" onclick="checkforblank(document.form1)">Raise</button>
			<a href="/customerHomePage?customerName=${customerName}"><input
			type="button" class="btn btn-primary" value="Back"></input></a>
		</form:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>