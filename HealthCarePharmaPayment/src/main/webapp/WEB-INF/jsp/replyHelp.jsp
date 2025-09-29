<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reply Tickets</title>
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
	<h3>Reply Tickets</h3>
	<h4 style="color: green">${message}</h4>
	<div class="Container">
		<form action="saveReply" method="POST">
			<div class="form-group">
				<label for="userName">Ticket Id</label> <input type="text"
					class="form-control" name="ticketId" value="${id}" required>
			</div>
			<div class="form-group">
				<label for="status" name="status">Solution</label> 
				<textarea class="form-control" name="reply" required></textarea>		
			</div>
			<button type="submit" class="btn btn-primary">Update</button>
			<a href="/helpRequest"><input type="button"
			class="btn btn-success" value="Back"></input></a>
		</form>
	
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</body>
</html>
