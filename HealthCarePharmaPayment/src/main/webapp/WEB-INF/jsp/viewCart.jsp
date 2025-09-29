<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Cart Details</title>
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

header {
	height: 72px;

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
    <a class="navbar-brand" href="/customerHomePage?customerName=${customerName}">Home</a>
  </div>

  <!-- Collect the nav links, forms, and other content for toggling -->
  <div class="collapse navbar-collapse navbar-ex1-collapse">
    <ul class="nav navbar-nav navbar-right">
      <li><a href="/help">Help</a></li>
      <li><a href="/home">Logout</a></li>
    </ul>
  </div><!-- /.navbar-collapse -->
</nav>




	<div class="container" >
	<h4 style="color: red">${message}</h4>
		<h2>Your Cart</h2>
		<table class="table table-hover table-borderless table-responsive"
			style="background-color: #FFFAFA">
			<thead>
				<tr>
					<th>Medicine</th>
					<th>Quantity</th>
					<th></th>
				</tr>
			</thead>
			<tbody id="myTable">
				<c:forEach var="item" items="${cart}">
					<tr>
						<td>${item.getMedicine()}</td>
						<td>${item.getQuantity()}</td>
						<td><a href="/removeMedicineFromCart?orderId=${orderId}&medicine=${item.getMedicine()}"><input type="button"
			class="btn btn-warning" value="Remove"></input></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<h4>Total Amount   -  Rs.${amount}</h4>
		<a href="/addMedicines?orderId=${orderId}"><input type="button"
			class="btn btn-primary" value="Order more"></input></a>
		<a href="/debitCard?amount=${amount}"><input type="button"
			class="btn btn-success" value="Place order"></input></a>
	</div>
</body>
</html>