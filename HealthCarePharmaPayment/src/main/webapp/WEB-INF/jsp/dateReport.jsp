<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Date Report</title>

<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>


<style>
@media (min-width: 768px) {
  .navbar-collapse {
    height: auto;
    border-top: 0;
    box-shadow: none;
    max-height: none;
    padding-left:0;
    padding-right:0;
  }
  .navbar-collapse.collapse {
    display: block !important;
    width: auto !important;
    padding-bottom: 0;
    overflow: visible !important;
  }
  .navbar-collapse.in {
    overflow-x: visible;
  }

.navbar
{
	max-width:300px;
	margin-right: 0;
	margin-left: 0;
}	

.navbar-nav,
.navbar-nav > li,
.navbar-left,
.navbar-right,
.navbar-header
{float:none !important;}

.navbar-right .dropdown-menu {left:0;right:auto;}
.navbar-collapse .navbar-nav.navbar-right:last-child {
    margin-right: 0;
}
}
body{
background-color: lavender;
}

</style>

</head>
<body>
<nav class="navbar navbar-default" role="navigation">
  <!-- Brand and toggle get grouped for better mobile display -->
  <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
      <span class="sr-only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
    </button>
    <a class="navbar-brand" href="/adminHomePage">Home</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav">
      <li class="dropdown">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Generate Report <b class="caret"></b></a>
        <ul class="dropdown-menu">
          <li><a href="/generateReport">Stock</a></li>
          <li><a href="/brandReport">Brand</a></li>
          <li><a href="/diseaseReport">Disease</a></li>
          <li class="active"><a href="/dateReport">Expiry Date</a></li>
        </ul>
      </li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/home">Logout</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>

<div class="container" >
		<h3>Expiry date</h3>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Medicine Id</th>
					<th>Medicine Name</th>
					<th>Expiry Date</th>
					
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${medicineDetails}">
					<tr>
						<td>${item.getMedicineId()}</td>
						<td>${item.getMedicineName()}</td>
						<td>${item.getExpiryDate()}</td>
						
					</tr>
				</c:forEach>
			</tbody>
		</table>
			</div>


</body>
</html>