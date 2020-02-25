<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up</title>
</head>
<body>
	<h2>${msg }</h2>
	<h1>Sign Up</h1>
	<form:form action="newAccount" method="post">
		<label for="userName">Username:</label>
		<input type="text" id="userName" name="userName">
		<br>
		<label for="password">Password:</label>
		<input type="password" id="password" name="password">
		<br>
		<label for="firstName">First Name:</label>
		<input type="text" id="firstName" name="firstName">
		<br>
		<label for="lastName">Last Name:</label>
		<input type="text" id="lastName" name="lastName">
		<br>
		<label for="email">Email:</label>
		<input type="email" id="email" name="email">
		<br>
		<br>
		<input type="submit" value="Sign In">


	</form:form>
</body>
</html>