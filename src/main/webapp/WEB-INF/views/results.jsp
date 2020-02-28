<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Results</h1>
	<form action="searchMain">
		<input type="text" placeholder="Search.." name="alcohol">
		<button type="submit">Search</button>
	</form>

	<c:forEach var="alcohol" items="${alc}">

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
				<c:when test="${alcohol.userId  != null}">
					<div>
						<a href="userPage?id=${alcohol.userId }">User page</a>
					</div>
				</c:when>
				<c:otherwise>
					<div></div>
				</c:otherwise>
			</c:choose>



			<div class="name">
				<H2>${alcohol.name }</H2>
				${alcohol.id }
			</div>

			<div class="descr">${alcohol.description}</div>
			<c:forEach var="star" items="${userRating}">
			Star by User: ${star.number }	
			</c:forEach>

			
			<br>
			Star:${alcohol.getRating(alcohol.id) }
			<button onclick="addLike"></button>
			<form:form action="addLike" method="get">
			<label for="alchId">Alcohol</label>
			<input type="hidden" id="alchId" name ="alchId" value="${alcohol.id }">
			<input type="submit" value="add Like">
			</form:form>
			Likes:${alcohol.getLikes(alcohol.id) }
			<c:choose>
						<c:when test="${star.get(alcohol.id) != null}">
							User rating: ${star.get(alcohol.id)}
						</c:when>
						<c:otherwise>
							User Rating: 0
						</c:otherwise>
					</c:choose>
			<div class="comment">
				
				<%-- ${alcohol.getComments().getAccount().userName } --%>
				${alcohol.getComments() }
				<button onclick="commentButton()">New Comment</button>
				<div id="addComment" style="display:none">
					<form:form action="addComment" method="get">
						<label for="alchId">Alcohol</label>
						<input type="hidden" id="alchId" name="alchId"
							value="${alcohol.id }">
						<label for="text">Text:</label>
						<input type="text" id="text" name="text">
						<br>
						<input type="submit" value="Add Comment">
					</form:form>
				</div>
			</div>
		</div>
	</c:forEach>

	<form:form action="addAlcohol" method="get">
		<label for="name">Name:</label>
		<input type="text" id="name" name="name">
		<br>
		<label for="description">Description:</label>
		<input type="text" id="description" name="description"
			style="width: 150px; height: 100px;">
		<br>
		<label for="pic">Picture:</label>
		<input type="pic" id="pic" name="pic">
		<br>

		<br>
		<label for="type">Choose a type:</label>
		<select id="type" name="type">
			<option value="beer">Beer</option>
			<option value="spirit">Spirit</option>
			<option value="recipe">Recipe</option>
		</select>
		<br>
		<input type="submit" value="Add">
	</form:form>
	<script type="text/javascript">
		function commentButton() {
			var x = document.getElementById("addComment");
			if (x.style.display === "block") {
				x.style.display = "none";
			} else {
				x.style.display = "block";
			}
		}

	</script>
</body>
</html>