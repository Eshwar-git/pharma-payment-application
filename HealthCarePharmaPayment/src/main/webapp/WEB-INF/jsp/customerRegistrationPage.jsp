<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Registration form</title>
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
	<h3>Customer Registration Form</h3>
	<div>
		<form:form class="Container" modelAttribute="customer" name="form1"
			action="/customerRegistration" method="GET">
			<h4 style="color: green">${message}</h4>
			<div class="form-group">
				<label>First Name</label><br>
				<form:input class="form-control" type="text" path="firstName"
					id="fname" required="required" />
			</div>
			<div class="form-group">
				<label>Last Name</label><br>
				<form:input class="form-control" type="text" path="lastName"
					id="lname" required="required" />
			</div>
			<div class="form-group">
				<label>Age</label><br>
				<form:input class="form-control" type="number" path="age" id="age"
					required="required" />
			</div>
			<div class="form-group">
				<label>Gender</label><br>
				<form:select class="form-control" path="gender" id="sell">
					<form:option path="gender" value="Male">Male</form:option>
					<form:option path="gender" value="Female">Female</form:option>
					<form:option path="gender" value="Others">Others</form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label>Contact Number</label><br>
				<form:input class="form-control" type="text" path="contactNumber"
					id="phone" required="required" />
			</div>
			<div class="form-group">
				<label>Email</label><br>
				<form:input class="form-control" type="text" path="email" id="email"
					required="required" />
			</div>
			<div class="form-group">
				<label>User Id</label><br>
				<form:input class="form-control" type="text" path="userId"
					id="user" required="required" />
			</div>
			<div class="form-group">
				<label>Password</label><br>
				<form:input class="form-control" type="text" path="password"
					id="pas" required="required" />
			</div>

			<div class="form-group">
				<label>Security Question</label><br>
				<form:select class="form-control" path="securityQuestion" id="secq">
					<form:option path="securityQuestion" value="Your Nick Name">Your Nick Name</form:option>
					<form:option path="securityQuestion" value="Your Pet's Name">Your Pet's Name</form:option>
					<form:option path="securityQuestion" value="City you are born in">City you are born in</form:option>
				</form:select>
			</div>
			<div class="form-group">
				<label>Security Answer</label><br>
				<form:input class="form-control" type="text" path="securityAnswer"
					id="seca" required="required" />
			</div>


			<button type="submit" class="btn btn-success"
				onclick="checkforblank(document.form1)">Save</button>
			<br>
			<p id="validation">
				Already registered?<a id=a2 href="/customerLoginPage" title="login">
					Login here.</a>
			</p>
		</form:form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
		function checkforblank(form1) {
			if (document.getElementById('fname').value == "") {
				alert('please enter your first name');
				document.getElementById('fname').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('lname').value == "") {
				alert('please enter your last name');
				document.getElementById('lname').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('age').value == "") {
				alert('please enter your age');
				document.getElementById('age').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('sell').value == "") {
				alert('please select gender');
				document.getElementById('sell').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('phone').value == "") {
				alert('please enter phone number');
				document.getElementById('phone').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('email').value == "") {
				alert('please enter email id');
				document.getElementById('email').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('user').value == "") {
				alert('please enter UserId');
				document.getElementById('user').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('pas').value == "") {
				alert('password should be minimum 6 characters with special symbols');
				document.getElementById('pas').style.borderColor = "red";
				return false;
			}

		}
	</script>
</body>
</html>