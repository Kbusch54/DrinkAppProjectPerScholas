<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
<head>
<style>
body {
	font-family: 'Raleway', sans-serif;
	background-color: #F7FFF7;
}
/*  
	Hue around wrapper 
	Div
*/
.wrapper {
	width: 800px;
	height: 600px;
	position: relative;
	margin: 3% auto;
	box-shadow: 2px 18px 70px 0px #ed8240;
	overflow: hidden;
}
/*  
	Login text where form is 
	Div
*/
.login-text {
	width: 800px;
	height: 230px;
	background: linear-gradient(to left, #90303d, #ffd369);
	position: absolute;
	top: -50px;
	box-sizing: border-box;
	padding: 6%;
	transition: all 0.5s ease-in-out;
	z-index: 11;
}

.text {
	margin-left: 20px;
	color: #90303d;
	display: none;
	transition: all 0.5s ease-in-out;
	transition-delay: 0.3s;
}

/*  
	Drop down button
*/
.dropdown {
	width: 60px;
	height: 60px;
	border-radius: 50%;
	background: #230444;
	border: 2px solid #fff;
	position: absolute;
	bottom: -30px;
	left: 370px;
	color: #fff;
	outline: none;
	cursor: pointer;
	z-index: 11;
}

.call-text {
	background-color: #fff;
	width: 800px;
	height: 450px;
	position: absolute;
	bottom: 0;
	padding: 10%;
	box-sizing: border-box;
	text-align: center; h1 { font-size : 800px;
	margin-top: 10%;
	color: #696a86; span { color : #230444;
	font-weight: bolder;
}

}
}
.show-hide {
	display: block;
}

.expand {
	transform: translateY(150px);
}
</style>
<%@ page isELIgnored="false"%>
<meta http-equiv="Content-Type"
	content="text/html;  
 charset=ISO-8859-1">
<title>SignIn</title>
</head>
<body>

	<h2>Drink App</h2>
	
	${msg }
	<div class="wrapper">
		<div class="login-text">
			<button class="dropdown">
				<i class="down"></i>
			</button>
			<div class="text">
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


			</div>
		</div>
		<div class="call-text">
			<h1>
				Have A Drink <span>ON</span> US
			</h1>
			<a href="createAccount">Create an Account</a>
		</div>
		<div></div>
	</div>

	<div class="wrapper2"></div>


	<script>
		var dropdown = document.querySelector(".dropdown");
		var check = 0;

		dropdown.addEventListener('click', function(e) {
			var text = e.target.nextElementSibling;
			var loginText = e.target.parentElement;
			text.classList.toggle('show-hide');
			loginText.classList.toggle('expand');
			if (check == 0) {
				dropdown.innerHTML = "<i class=\"up\"></i>";
				check++;
			} else {
				dropdown.innerHTML = "<i class=\"down\"></i>";
				check = 0;
			}
		})
	</script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>