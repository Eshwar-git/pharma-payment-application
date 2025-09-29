<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Login Form</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	width: 400px;
	margin: auto;
	padding-top: 7.5em;
	background-color: lavender;
}

div {
	padding: 1em;
}
</style>

</head>
<body>
	<div class="portal" style="background-color: #F5F5DC">
		<h4 style="color: orange">Please login to continue as Admin!</h4>
		<h4 style="color: red">${errorMessage}</h4>
		<h4 style="color: green">${message}</h4>
		
		
		<form action="updatePassword" name="form1" method="POST">
			<div class="form-group">
				<label for="userName">Admin id:</label> <input type="text"
					class="form-control" id="uname" name="userName"
					aria-describedby="emailHelp" placeholder="Enter UserName" required>
			</div>
			<div class="form-group">
				<label>Security Question:</label><br> <select
					class="form-control" name="securityQuestion" id="secq">
					<option name="securityQuestion" value="Your Nick Name">Your
						Nick Name</option>
					<option name="securityQuestion" value="Your Pet's Name">Your
						Pet's Name</option>
					<option name="securityQuestion" value="City you are born in">City
						you are born in</option>
				</select>
			</div>
			<div class="form-group">
				<label>Security Answer:</label><br> <input class="form-control"
					type="text" name="securityAnswer" id="seca" required="required" />
			</div>
			<div class="form-group">
				<label for="userName">Password:</label> <input type="password"
					class="form-control" id="pas" name="password"
					placeholder="Enter Password" required>
			</div>

			<button type="submit" class="btn btn-warning"
				onclick="checkforblank(document.form1)">Reset</button>
				<a href="/adminLoginPage"><input type="button" class="btn btn-success" value="Login" /></a>

		</form>
	</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script>
		function checkforblank(form1) {
			if (document.getElementById('uname').value == "") {
				alert(' user name is required');
				document.getElementById('uname').style.borderColor = "red";
				return false;
			}
			if (document.getElementById('pas').value == "") {
				alert('password is required');
				document.getElementById('pas').style.borderColor = "red";
				return false;
			}
		}
	</script>
</body>
</html>