<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<link href="/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet" />
<script src="/bootstrap/js/jquery.min.js" type="text/javascript"></script>
<script src="/bootstrap/js/popper.min.js" type="text/javascript"></script>
<script src="/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style>
.wrapper {
	background-color: lightgrey;
	
	border: 10px #90303d;
	width:80%;
	opacity: 0.7;
	
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
<meta charset="UTF-8" name="viewport"
	content="width=device-width, initial-scale=1">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/html/header.html"%>

	<div class="image">
		<div class="text">

			<h1>Search</h1>
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

		
			<div class="container-fluid">
					<div class="container">
						<div class="row">
							<div class="col-12 col-lg-7">
								<h2><a href="alcoholSelect?alcId=${alcohol.id }">${alcohol.name }</a></h2>
								Type:
								${alcohol.type }
							</div>
							<div class="col-12 col-lg-3">
							
							</div>
							<div class="col-12 col-lg-2">
							Rating:
								 <c:choose>
          <c:when test = "${alcohol.getRating(alcohol.id)==5 }">
           <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==4.5 }">
          <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==4 }">
          <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==3.5 }">
          <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==3}">
           <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==2.5}">
           <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==2}">
           <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${alcohol.getRating(alcohol.id)==1.5 }">
          <i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         
         <c:when test = "${alcohol.getRating(alcohol.id)==1 }">
          <i class="fas fa-star"></i> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         
         <c:otherwise>
            <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:otherwise>
       </c:choose>

</div>
</div>
</div>

		<c:choose>
			<c:when test="${alcohol.userId !=null}">
			<a href="userPage?id=${alcohol.userId }">User Page</a>
			</c:when>
		</c:choose>
			<c:forEach var="star" items="${userRating}">
			Star by User: ${star.number }	
			</c:forEach>
			<div class="container">
						<div class="row">
							<div class="col-12 col-lg-3"></div>
							<div class="col-12 col-lg-6">
			
					<c:choose>
						<c:when test="${alcohol.pic != null}">
							<img src="${alcohol.pic }" class="alcoholPic">
						</c:when>
						<c:otherwise>
							<img src="broken_image.jpg" class="alcoholPic">
						</c:otherwise>
					</c:choose>

				
							</div>
							<div class="col-12 col-lg-3"></div>
      
      </div>
						</div>
					
				
					<div class="container">
						<div class="row">
							<div class="col-12 col-lg-4"></div>
							<div class="col-12 col-lg-8" id="des">
							Description:
								${alcohol.description}
								</div>
								<div class="col-12 col-lg-2">

								</div>
						</div>
					</div>
				




			<div class="container">
						<div class="row">
							<div class="col-12 col-lg-3">
							<!-- Likes -->
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
							</div>
							<div class="col-12 col-lg-6">

		<iframe name="ratingFrame" id="ratingFrame" style="display: none;">

				</iframe>
				<form:form action="setRating?alcId=${alcohol.id }" target="ratingFrame">
					<label for="num">Choose a rating:</label>
  <select id="num" name="num" size="5">
    <option value="1">1</option>
    <option value="2">2 </option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
  </select><br><br>
  <input type="submit" value="Rate">
				</form:form>
			<%-- <c:choose>
				<c:when test="${star.get(alcohol.id) != null}">
							User rating: ${star.get(alcohol.id)}
						</c:when>
				<c:otherwise>
							User Rating: 0
						</c:otherwise>
			</c:choose> --%>
									 <c:choose>
          <c:when test = "${star.get(alcohol.id)==5 }">
           User Rating: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==4.5 }">
          User Rating: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==4 }">
         User Rating:  <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==3.5 }">
          User Rating: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==3}">
          User Rating: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==2.5}">
          User Rating: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==2}">
           User Rating: <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         <c:when test = "${star.get(alcohol.id)==1.5 }">
         User Rating: <i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         
         <c:when test = "${star.get(alcohol.id)==1 }">
         User Rating: <i class="fas fa-star"></i> <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:when>
         
         <c:otherwise>
           User Rating: <i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i><i class="far fa-star"></i>
         </c:otherwise>
       </c:choose>
							</div>
							<div class="col-12 col-lg-3">
			<!--Category search  -->
			<c:choose>
				<c:when test="${cate.get(alcohol.id) != null}">
							<h3>Category:</h3>
							<h3> <a href="categorySearch?catName=${cate.get(alcohol.id)}">${cate.get(alcohol.id)}</a></h3>

				</c:when>
				<c:otherwise>
							No Category
						</c:otherwise>
			</c:choose>
							</div>

		</div>
		</div>
		<br><br><div class="line"></div><br><br><br>
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
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script src="./js/jquery.min.js" type="text/javascript"></script>
	<script src="./js/popper.min.js" type="text/javascript"></script>
	<script src="./js/bootstrap.min.js" type="text/javascript"></script>
</body>
</html>