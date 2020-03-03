<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400"
	rel="stylesheet">
<link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<meta charset="UTF-8">
<style>
#instr {
	font-size: large;
}

body, html {
	height: 100%;
	margin: 0;
	background: linear-gradient(to left, #E1E8E1, #E6ECE6);
}

#image {
	background-image: url("car3.jpeg");
	height: 400px;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

#con {
	background: linear-gradient(to right, #90303d, #ffd369);
}
</style>
<title>Adding Alcohol</title>
</head>
<body>
	<%@include file="/html/header.html"%>
	<!-- New alcohol  -->


	<div class="container" id="con">
		<div class="row">
			<div class="col-12 col-lg-12" id="image"></div>
			<div class="col-12 col-lg-12" id="instr">
				<h1>Fill out the Boxes</h1>
			</div>
			<form:form action="addAlcohols" method="get">
				<div class="col-12 col-lg-6">

					<label for="name">Name:<br></label> <input type="text" id="name"
						name="name">
				<br><br><br><br>
				</div>
				<div class="col-12 col-lg-6">
					<label for="pic">Picture:</label> <input type="pic" id="pic"
						name="pic">
				<br><br><br>
				</div>
				<div class="col-12 col-lg-6">
					<label for="type">Choose a type:</label> <select id="type"
						name="type">
						<option value="beer">Beer</option>
						<option value="spirit">Spirit</option>
						<option value="recipe">Recipe</option>
					</select>
				</div>
				<div class="col-12 col-lg-6">
					<label for="description">Description: <br></label> <input type="text"
						id="description" name="description"
						style="width: 70%; height: 70%;">
						
				</div>
				<div class="col-12 col-lg-10"></div>
				<div class="col-12 col-lg-2">
				<input type="submit" value="Add Alcohol">
				</div>
			</form:form>

		</div>




	</div>










</body>
</html>