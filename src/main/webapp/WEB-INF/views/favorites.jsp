<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
  <link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet"/>
    <script src="./js/jquery.min.js" type="text/javascript"></script>
    <script src="./js/popper.min.js" type="text/javascript"></script>
    <script src="./js/bootstrap.min.js" type="text/javascript"></script>
<style>
.largeBox {
	background-color: linear-gradient(to left, #90303d, #ffd369);
	width: 60%;
	border: 10px solid green;
	padding: 5%;
	margin: 10%;
}
.picBox{
	background-color: #ffd369;
	width: 50%;
	border: 5px solid green;
	padding: 5%;
	margin: 15%;
}

.alcoholPic {
	width: 100%;
	height: 100%:
}

.pic {
	width: 100%;
	height: 20%;
}
.name {
	background-color: #ffd369;
	width: 60%;
	border: 10px solid blue;
	padding: 5%;
	margin: 10%;
}
.descr{
	background-color: #ffd369;
	width: 60%;
	border: 10px solid green;
	padding: 5%;
	margin: 10%;

}
.comment{
	background-color: #ffd369;
	width: 60%;
	border: 10px solid orange;
	padding: 5%;
	margin: 10%;

}
body, html {
	height: 100%;
	margin: 0;
	background: linear-gradient(to left, #90303d, #ffd369);
}


.image {
	background-image: url("car1.jpeg");
	height: 60%;
	/* Center and scale the image nicely */
	background-position: center;
	background-repeat: no-repeat;
	background-size: cover;
}

.text {
	top: 25%;
	text-align: center;
	position: absolute;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	text-align: center;
}
.line {
  border: 2px solid black;
 
}


.search {
	width: 70%;
	height: 10%;
}

.btn {
	width: 18%;
	height: 10%;
}

.picBox {
	background-color: lightgrey;
	width: 50%;
	
	padding: 5%;
	margin: 15%;
}

.alcoholPic {
	width: 100%;
	height: 100%:
}

.pic {
	width: 100%;
	height: 20%;
}
#des {
  width: 30%;
  height: 10%;
  border: 1px solid blue;
  align:center;
}

#name {
	background-color: lightgrey;
	width: 60%;
	padding: 1%;
	font-size: 110%;
}

.descr {
	background-color: lightgrey;
	width: 60%;
	border: 10px solid green;
	padding: 5%;
	margin: 10%;
}

.comment {
	background-color: lightgrey;
	width: 60%;
	border: 10px solid orange;
	padding: 5%;
	margin: 10%;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="/html/header.html" %> 
	<h1>Favorites</h1>
	
	<c:forEach var="lk" items="${like}">
		<h2 style="color:white;"><a href="alcoholSelect?alcId=${lk.getAlcohol().getId()}">${lk.getAlcohol().getName() }</a></h2> 
		
	
		<div class="largeBox">
			<c:choose>
					<c:when test="${lk.getAlcohol().userId  != null}">
						<div><a href="userPage?id=${lk.getAlcohol().userId }">User page</a></div>
					</c:when>
					<c:otherwise>
						<div></div>
					</c:otherwise>
				</c:choose>
		<div class="picBox">
			<div class="pic">
				<c:choose>
					<c:when test="${lk.getAlcohol().pic != null}">
						<img src="${lk.getAlcohol().pic }" class="alcoholPic">
					</c:when>
					<c:otherwise>
						<img src="broken_image.jpg" class="alcoholPic">
					</c:otherwise>
				</c:choose>

			</div>
			</div>
			
			
			
			
		
			<div class="descr">${lk.getAlcohol().description}</div>
	
			
		</div>
		
	</c:forEach>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>