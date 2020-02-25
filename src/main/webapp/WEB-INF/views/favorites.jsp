<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
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
.picBox{
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
.descr{
	background-color: lightgrey;
	width: 60%;
	border: 10px solid green;
	padding: 5%;
	margin: 10%;

}
.comment{
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

	<h1>Favorites</h1>
	
	<c:forEach var="lk" items="${like}">
		${lk.getAlcohol().getName() }
		
		
		<div class="largeBox">
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
			<c:choose>
					<c:when test="${lk.getAlcohol().userId  != null}">
						<div><a href="userPage?id=${lk.getAlcohol().userId }">User page</a></div>
					</c:when>
					<c:otherwise>
						<div></div>
					</c:otherwise>
				</c:choose>
			
			
			
			<div class="name"><H2>${lk.getAlcohol().name }</H2></div>
		
			<div class="descr">${lk.getAlcohol().description}</div>
			Star:${alcohol.getRating(lk.getAlcohol().id) }
			Likes:${alcohol.getLikes(lk.getAlcohol().id) }
			<div class="comment">${lk.getAlcohol().comments }
			</div>
		</div>
		
	</c:forEach>

</body>
</html>