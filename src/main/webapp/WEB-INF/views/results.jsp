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
.largeBox {
	background-color: lightgrey;
	width: 70%;
	border: 10px solid green;
	padding: 5%;
	margin: 10%;
	opacity: 0.7;
	left: 50%;
}

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
	top: 20%; text-align : center;
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
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Insert title here</title>
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
	<c:forEach var="alcohol" items="${alc}">

		<div class="largeBox">
			<c:choose>
				<c:when test="${alcohol.userId != null}">
					<div class="name">
						<a href="alcoholSelect?alcId=${alcohol.id }">${alcohol.name }</a>
					</div>
				</c:when>
				<c:otherwise>

				</c:otherwise>
			</c:choose>




			<!-- fix -->
			<a href="userPage?id=${alcohol.userId }">${alcohol.getUserName(alcohol.userId) }</a>
			<c:forEach var="star" items="${userRating}">
			Star by User: ${star.number }	
			</c:forEach>



			<!-- Alcohol ratings  -->

			<br> Star:${alcohol.getRating(alcohol.id) }
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




			<div class="descr">${alcohol.description}</div>
			
			<!-- Likes -->
			
			
			
			<c:choose>
				<c:when test="${like.get(alcohol.id) != null}">
				<button onclick="removeLike"><i class="fas fa-heart"></i></button>
							<!-- <img src="like.png" class="like"> -->
			<form:form action="removeLike" method="get">
				<label for="alchId">Alcohol</label>
				<input type="hidden" id="alchId" name="alchId"
					value="${alcohol.id }">
				<input type="submit" value="removeLike">
			</form:form>
						</c:when>
				<c:otherwise>

				<button onclick="addLike"><i class="far fa-heart"></i></button>
							<!-- <img src="nolike.png" class="like"> -->
			<form:form action="addLike" method="get">
				<label for="alchId">Alcohol</label>
				<input type="hidden" id="alchId" name="alchId"
					value="${alcohol.id }">
				<input type="submit" value="add Like">
			</form:form>
						</c:otherwise>
			</c:choose>


			<!--Alcohol Likes  -->
			Likes:${alcohol.getLikes(alcohol.id) }

			<c:choose>
				<c:when test="${star.get(alcohol.id) != null}">
							User rating: ${star.get(alcohol.id)}
						</c:when>
				<c:otherwise>
							User Rating: 0
						</c:otherwise>
			</c:choose>
			<!--Category search  -->
			<c:choose>
				<c:when test="${cate.get(alcohol.id) != null}">
							Category:
							 <a href="categorySearch?catName=${cate.get(alcohol.id)}">${cate.get(alcohol.id)}</a>

				</c:when>
				<c:otherwise>
							No Category
						</c:otherwise>
			</c:choose>
			<%-- 


			<!--Alcohol Comments  -->

			<div class="comment">

				<c:choose>

					<c:when test="${commentText.get(alcohol.id) != null}">
						${commentText.get(alcohol.id)}
							<c:forEach items="${comments.get(alcohol.id)}" var="comm">
							${comm.getAccount().getUser_Name()}
							${comm.getText() }
							</c:forEach>
						
					</c:when>
					<c:otherwise>
					No Comment
					</c:otherwise>
				</c:choose>



				<!--New comment form  -->

				<div>
					New Comment
					<iframe name="commentFrame" id="commentFrame" style="display: none;"></iframe>

					<form action="addComment" target="commentFrame" method="get">
						<!-- form body here -->
						<label for="alchId">Alcohol</label> <input type="hidden"
							id="alchId" name="alchId" value="${alcohol.id }"> <label
							for="text">Text:</label> <input type="text" id="text" name="text">
						<br> <input type="submit" value="Add Comment">
					</form> --%>

			<%-- <form:form action="addComment" method="get">
						<label for="alchId">Alcohol</label>
						<input type="hidden" id="alchId" name="alchId"
							value="${alcohol.id }">
						<label for="text">Text:</label>
						<input type="text" id="text" name="text">
						<br>
						<input type="submit" value="Add Comment">
					</form:form> --%>
		</div>


	</c:forEach>



	

	<script type="text/javascript">
		/* function commentButton() {
			var x = document.getElementById("addComment");
			if (x.style.display === "block") {
				x.style.display = "none";
			} else {
				x.style.display = "block";
			}
		} */

		//Array of images which you want to show: Use path you want.
		var images = new Array('car1.jpeg', 'car2.jpeg', 'car3.jpeg');
		var nextimage = 0;
		doSlideshow();

		function doSlideshow() {
			if (nextimage >= images.length) {
				nextimage = 0;
			}
			$('.body').css('background-image',
					'url("' + images[nextimage++] + '")').fadeIn(500,
					function() {
						setTimeout(doSlideshow, 1000);
					});
		}
	</script>
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>  
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
  <script src="./js/jquery.min.js" type="text/javascript"></script>
<script src="./js/popper.min.js" type="text/javascript"></script>
<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>