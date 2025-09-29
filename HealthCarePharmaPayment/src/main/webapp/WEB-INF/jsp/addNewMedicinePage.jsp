<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Medicine</title>
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
	<h3>Add New Medicine</h3>
	<div>
		<form:form class="Container" action="/submitAddedMedicine" modelAttribute="medicine" name="form1" method="GET">
		<h4 style="color:red">${message}</h4>
			<div class="form-group">
				<label>Medicine Id</label><br> <form:input class="form-control"
					type="number" path="medicineId" id="med" required="required" />
			</div>
			<div class="form-group">
				<label>Medicine Name</label><br> <form:input class="form-control"
					type="text" path="medicineName" id="name" required="required" />
			</div>
			<div class="form-group">
				<label>Manufacturer</label><br> <form:input class="form-control"
					type="text" path="manufacturer" id="manu" required="required" />
			</div>
			<div class="form-group">
				<label>Quantity Per Strip</label><br> <form:input class="form-control"
					type="text" path="quantityPerStrip" id="quanti" required="required" />
			</div>
			<div class="form-group">
				<label>MRP</label><br> <form:input class="form-control"
					type="number" path="mrp" id="mrp" required="required" />
			</div>
			<div class="form-group">
				<label>Manufacturing Date</label><br> <form:input class="form-control"
					type="text" path="manufacturingDate" id="date" required="required" />
			</div>
			<div class="form-group">
				<label>Expiry Date</label><br> <form:input class="form-control"
					type="text" path="expiryDate" id="exdate" required="required"/>
			</div>
			<div class="form-group">
				<label>Type</label><br> <form:input class="form-control"
					type="text" path="type" id="type" required="required" />
			</div>
			<div class="form-group">
				<label>Disease</label><br> <form:input class="form-control"
					type="text" path="disease" id="type" required="required" />
			</div>
			<div class="form-group">
				<label>Stock</label><br> <form:input class="form-control"
					type="number" path="stock" id="stock" required="required" />
			</div>
			
			<button type="submit" class="btn btn-success" onclick="checkforblank(document.form1)">Save</button>
			<a href="/medicineInformation"><input type="button" class="btn btn-primary" value="Back"></input></a>
		</form:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
	function checkforblank(form1)
	{
		if(document.getElementById('med').value=="")
		{
		alert('please enter medicine id');
		document.getElementById('med').style.borderColor="red";
		return false;
		}
		if(document.getElementById('name').value=="")
		{
		alert('please enter medicine name');
		document.getElementById('name').style.borderColor="red";
		return false;
		}
		if(document.getElementById('manu').value=="")
		{
		alert('Enter manufacture name');
		document.getElementById('manu').style.borderColor="red";
		return false;
		}
		
		if(document.getElementById('quanti').value=="")
		{
		alert('please mention Quantity');
		document.getElementById('quanti').style.borderColor="red";
		return false;
		}
		if(document.getElementById('mrp').value=="")
		{
		alert('please enter the price');
		document.getElementById('mrp').style.borderColor="red";
		return false;
		}
		if(document.getElementById('date').value=="")
		{
		alert('Mention manufacturing date');
		document.getElementById('date').style.borderColor="red";
		return false;
		}
		if(document.getElementById('exdate').value=="")
		{
		alert('Mention expiry date');
		document.getElementById('exdate').style.borderColor="red";
		return false;
		}
		if(document.getElementById('type').value=="")
		{
		alert('please mention type');
		document.getElementById('type').style.borderColor="red";
		return false;
		}
		if(document.getElementById('stock').value=="")
		{
		alert('please mention in or out of stock');
		document.getElementById('stock').style.borderColor="red";
		return false;
		}
		}
		</script>
</body>
</html>