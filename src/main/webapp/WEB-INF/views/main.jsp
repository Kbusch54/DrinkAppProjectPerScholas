<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<meta charset="UTF-8" name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/css?family=Roboto:300,400"
	rel="stylesheet">
	<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<title>Insert title here</title>
<style type="text/css">

.image {
  background-image: url("car1.jpeg");
  background-color: #cccccc;
  height: 780px;
  background-position: center;
  background-repeat: no-repeat;
  background-size: cover;
  position: relative;
}

.text {
  text-align: center;
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  color: white;
}
.search{
	width: 550px;
	height:40px;
	}
	
.btn{
	width:40px;
	height:40px;}
</style>
</head>
<body>
	<div class="image">
		<div class="text">
	<h1>Main Search</h1>
		<form action="searchMain">
			<input type="text" placeholder="Search" name="alcohol" class="search">
			
			<button type="submit" class="btn"><i class="fas fa-cocktail"></i></button>
		</form>
	</div>
		</div>
	

</body>
</html>