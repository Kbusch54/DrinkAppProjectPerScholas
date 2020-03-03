<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet" />

<link href="https://fonts.googleapis.com/css?family=Roboto:300,400"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<style>
.wrapper {
	height: 60%;
	width: 100%;
}

.pic {
	height: 100%;
	width: 85%;
}

.profilelPic {
	height: 50%;
	width: 20%;
}

#userStats{
	background-color:blue;
	}
#userDiv{
	background: linear-gradient(to left, #E1E8E1, #F7FFF7);
	}
#fav{
	background:#CBD1CB;}
</style>

<meta charset="UTF-8">
<title>User page</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
</head>
<body  id="userDiv">
<%@include file="/html/header.html" %> 
	<h1>User page</h1>
	<div class="container">
		<div class="row">
			<div class="col-12 col-lg-5">

				<c:choose>
					<c:when test="${account.getPicture()  != null}">
						<img src="${account.getPicture() }" class="pic">
					</c:when>
					<c:otherwise>
						<img src="noProfile.jpg" class="pic">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-12 col-lg-7">
				<h1>${account.getFirst_Name() }${account.getLName() }</h1>
				<br>
				<h2>Bio:</h2>
				<h4>${account.getBio() }</h4>
				<br>
			<h3>User Info: </h3>
			
				User Name: ${account.getUser_Name() }<br> <br>
				First Name: ${account.getFirst_Name() } <br><br>
				Last Name: ${account.getLName() } <br><br>
			    Email: ${account.getEmail() }
			    <br><br>
			</div>

		</div>



	</div>
	<div id="fav">
	<h1>
		<a href="favorites?id=${account.getId()}">Favorites</a>
	</h1>
		<%-- <c:forEach items="${alcohol }" var="alc">
			${alc.name }
		</c:forEach> --%>

	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="./js/jquery.min.js" type="text/javascript"></script>
	<script src="./js/popper.min.js" type="text/javascript"></script>
	<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>