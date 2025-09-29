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
body{
  width:400px;
  margin: auto;
  padding-top:12em;
  background-color: lavender;
}
div{
padding:1em;
}
</style>
	
</head>
<body>
<div class="portal" style="background-color: #F5F5DC">

<h4 style="color:orange">Please login to continue as Admin!</h4>
<h4 style="color:red">${errorMessage}</h4>
	<form action="adminLogin" name="form1" method="POST">
  <div class="form-group">
    <label for="userName">Admin id:</label>
    <input type="text" class="form-control" id="uname" name="userName" aria-describedby="emailHelp" placeholder="Enter UserName" required>
  </div>
  <div class="form-group">
    <label for="userName">Password:</label>
    <input type="password" class="form-control" id="pas" name="password" placeholder="Enter Password" required>
  </div>
  <button type="submit" class="btn btn-success" onclick="checkforblank(document.form1)" >Login</button>
  <button type="reset" class="btn btn-warning">Reset</button>
  <br><br>
  <p id="validation">
				Forget Password?<a id=a2 href="/resetPasswordAdmin" title="Reset Password">
					Reset Password</a>
			</p>
  
</form>
</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
		<script>
	function checkforblank(form1)
	{
	if(document.getElementById('uname').value=="")
	{
	alert(' user name is required');
	document.getElementById('uname').style.borderColor="red";
	return false;
	}
	if(document.getElementById('pas').value=="")
	{
	alert('password is required');
	document.getElementById('pas').style.borderColor="red";
	return false;
	}
	}
	</script>
</body>
</html>