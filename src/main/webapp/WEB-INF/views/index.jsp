<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type"
	content="text/html;  
 charset=ISO-8859-1">
<title>SignIn</title>
</head>
<body>
	<h2>Spring Landing Page</h2>
	<p>Sign in</p>
	${msg }

	<div>
		<form:form action="signIn" method="post">
			<label for="userName">Username:</label>
			<input type="text" id="userName" name="userName">
			<br>
			<label for="password">Password:</label>
			<input type="password" id="password" name="password">
			<br>
			<br>
			<input type="submit" value="Sign In">
		</form:form>

		<form:form action="createAccount">

			<input type="submit" value="Sign Up" />

		</form:form>

	</div>

</body>
</html>