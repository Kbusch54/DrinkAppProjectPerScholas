<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="./css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<style>
body, html {
	height: 100%;
	margin: 0;
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
	top: 20%;
	text-align: center;
	position: absolute;
	left: 50%;
	transform: translate(-50%, -50%);
	color: white;
	text-align: center;
}

.search {
	width: 70%;
	height: 10%;
}

.btn {
	width: 15%;
	height: 10%;
}

.largeBox {
	background-color: lightgrey;
	width: 60%;
	border: 10px solid green;
	padding: 5%;
	margin: 10%;
}

.picBox {
	background-color: lightgrey;
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
	background-color: lightgrey;
	width: 60%;
	border: 10px solid blue;
	padding: 5%;
	margin: 10%;
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

#indCom {
	border: 3px solid black;
	margin: 2%;
}
</style>
<meta charset="UTF-8">
<title>Alcohol</title>
</head>
<body>
<%@include file="/html/header.html" %> 
	<div class="image">
		<div class="text">

			<h1 style="color: white">Search</h1>
			<form action="searchMain">
				<input type="text" placeholder="Search" name="alcohol"
					class="search">

				<button type="submit" class="btn">
					<i class="fas fa-cocktail"></i>
				</button>
			</form>
		</div>
	</div>


	<!--Start of box  -->


	<div class="largeBox">
		<div class="picBox">
			<div class="pic">
				<c:choose>
					<c:when test="${alcohol.pic != null}">
						<img src="${alcohol.pic }" class="alcoholPic">
					</c:when>
					<c:otherwise>
						<img src="broken_image.jpg" class="alcoholPic">
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<c:choose>
			<c:when test="${alcohol.userId != null}">
				<div>
					<a href="userPage?id=${alcohol.userId }">User page</a>
				</div>
			</c:when>
			<c:otherwise>
				<div></div>
			</c:otherwise>
		</c:choose>
		<!--Category search  -->
		<c:choose>
			<c:when test="${cate.name != null}">
							Category:
							 <a href="categorySearch?catName=${cate.name}">${cate.name}</a>

			</c:when>
			<c:otherwise>
							No Category
						</c:otherwise>
		</c:choose>

		<div class="name">
			<H2>${alcohol.name }</H2>
			
		</div>

		<div class="descr">${alcohol.description}</div>
		<c:forEach var="star" items="${userRating}">
			Star by User: ${star.number }	
			</c:forEach>



		<!-- Alcohol Like  -->

		
			<c:choose>
				<c:when test="${like.get(alcohol.id) != null}">
								<iframe name="unlikeFrame" id="unlikeFrame" style="display: none;">

				</iframe>
					
					<form:form action="removeLike" method="get" target="unlikeFrame">
						<label for="alchId">Alcohol</label>
						<input type="hidden" id="alchId" name="alchId"
							value="${alcohol.id }">
						<button type="submit"><i class="fas fa-heart"></i></button>
					</form:form>
				</c:when>
				<c:otherwise>
						<iframe name="likeFrame" id="likeFrame" style="display: none;">

				</iframe>
					
					<!-- <img src="nolike.png" class="like"> -->
					<form:form action="addLike" method="get" target="likeFrame">
						<label for="alchId">Alcohol</label>
						<input type="hidden" id="alchId" name="alchId"
							value="${alcohol.id }">
						<button type="submit"><i class="far fa-heart"></i></button>
					</form:form>
				</c:otherwise>
			</c:choose>
		


		<!--Alcohol Likes  -->

		Likes:${alcohol.getLikes(alcohol.id) }
		



		<!--Alcohol Comments  -->

		<div class="comment">

			<c:choose>

				<c:when test="${comment != null}">

					<c:forEach items="${comment}" var="comm">

						<div class="container">
							<div class="row" id="indCom">
								<div class="col-12 col-sm-8">
									<a href="userPage?id=${comm.getAccount().getId()}">${comm.getAccount().getUser_Name()}</a></div>
								<div class="col-12 col-sm-8" >
								${comm.getText() }
								</div>
							</div>
						</div>
					</c:forEach>

				</c:when>
				<c:otherwise>
					No Comment
					</c:otherwise>
			</c:choose>



			<!--New comment form  -->

			<div>
				New Comment
				<iframe name="commentFrame" id="commentFrame" style="display: none;">

				</iframe>
				<form action="addComment" target="commentFrame" method="get">
					<!-- form body here -->
					<label for="alchId">Alcohol</label> <input type="hidden"
						id="alchId" name="alchId" value="${alcohol.id }"> <label
						for="text">Text:</label> <input type="text" id="text" name="text">
					<br> <input type="submit" value="Add Comment">
				</form>

			
			</div>

		</div>
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