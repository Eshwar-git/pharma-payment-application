<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>View Raised Tickets</title>
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
		<h2>Raised Tickets</h2>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Ticket Id</th>
					<th>Issue</th>
					<th>Description</th>
					<th>Date Of Issue</th>
					<th>Reply</th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${help}">
					<tr>
						<td>${item.getId()}</td>
						<td>${item.getIssue()}</td>
						<td>${item.getDescription()}</td>
						<td>${item.getDateOfIssue()}</td>
						<td>${item.getReply()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="/customerHomePage?customerName=${customerName}"><input
			type="button" class="btn btn-primary" value="Back"></input></a>
	</div>
</body>
</html>