<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.6.0/dist/umd/popper.min.js"
	integrity="sha384-KsvD1yqQ1/1+IA7gi3P0tyJcT3vR+NdBTt13hSJ2lnve8agRGXTTyNaBYmCR/Nwi"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.min.js"
	integrity="sha384-nsg8ua9HAw1y0W1btsyWgBklPnCUAFLuTMS2G72MMONqmOymq585AcH49TLBQObG"
	crossorigin="anonymous"></script>
<meta charset="ISO-8859-1">
<style>
body {
	text-align: center;
	align: center;
	background-image:
		url("https://img.freepik.com/free-photo/medical-health-care-background_1412-565.jpg?size=626&ext=jpg");
	background-repeat:repeat;
	background-size: 90% 90%;
}

form {
	display: inline-block;
	margin-top: 10%;
	margin-bottom: 10%;
	padding: 20px;
	background: rgba(92, 151, 191, 0.5);
}

.link {
	margin-top: 30px;
	margin-bottom: 30px;
}

td {
	font-weight: bold;
}

.row {
	margin-top: 50%;
	margin-bottom: 50%;
}

header {
	height: 72px;
	background-color: skyblue;
}

table {
	display: inline-block;
	background: rgba(92, 151, 191, 0.7);
	padding-right: 20px;
	padding-left: 20px;
}

a {
	color: black;
	font-weight: bold;
	text-decoration: none;
}

.space {
	padding-top: 30px;
	padding-left: 10px;
	padding-right: 10px;
}

.heading {
	font-size: 45px;
	padding-right: 210px;
	padding-left: 410px;
}

footer {
	background-color: skyblue;
	color: white;
	text-align: center;
	position: absolute;
	bottom: 0;
	width: 100%;
	height: 30px
}

h3 {
	padding-top: 0.5em;
}

.alert {
	padding: 10px;
	border-color:red;
	background-color:#EEE8AA;
	color: red;
	width: 30%;
	margin: auto;
	margin-bottom: 5px;
}

.closebtn {
	margin-left: 15px;
	color: red;
	font-weight: bold;
	float: right;
	font-size: 22px;
	line-height: 20px;
	cursor: pointer;
	transition: 0.3s;
}

.closebtn:hover {
	color: black;
}
</style>



<title>Admin Home Page</title>
</head>
<body>
	<header>
		<nav class="site-nav">
			<ul class="nav justify-content-center">
				<li><img
					src="https://p7.hiclipart.com/preview/395/546/561/medicine-health-care-logo-health-thumbnail.jpg"
					height=100px, width=100px id="logo"></li>
				<li class="heading" style="">Health Care</li>

				<ul class="nav nav-tabs justify-content-end space">

					<li class="nav-item"><a class="nav-link" href="/home">Logout</a></li>
					<li class="nav-item"><a class="nav-link" href="/helpRequest">Help
							Request</a></li>

				</ul>
			</ul>
		</nav>
	</header>
	<h3>Hello, ${username} You are Admin .</h3>
	<br>

	<c:set var="salary" scope="session" value="${value}" />
	<c:if test="${salary > 10}">
		<c:forEach var="item" items="${notification}">
			<div class="alert">
				<span class="closebtn"
					onclick="this.parentElement.style.display='none';">&times;</span> <strong>Alert : ${item}!</strong>
			</div>
		</c:forEach>
	</c:if>



	<table>
		<tr>
			<th></th>
			<td><a href="/medicineInformation" class="btn btn-info link">Medicine
					Information</a></td>
		</tr>
		<tr>
			<th></th>
			<td><a href="/updateStock" class="btn btn-info link"> Update
					Stock</a></td>
		</tr>
		<tr>
			<th></th>
			<td><a href="/viewStock" class="btn btn-info link"> View
					Stock </a></td>
		</tr>
		<tr>
			<th></th>
			<td><a href="/viewOrder" class="btn btn-info link"> View
					Order </a></td>
		</tr>
		<tr>
			<th></th>
			<td><a href="/generateReport" class="btn btn-info link">
					Generate Report </a></td>
		</tr>
		<tr>
			<th></th>
			<td><a href="/helpRequest" class="btn btn-info link">
					Help Request </a></td>
		</tr>
		



	</table>
	
</body>
</html>