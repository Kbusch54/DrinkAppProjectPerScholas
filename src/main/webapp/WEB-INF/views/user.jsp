<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<!DOCTYPE html>
<html>
<head>
<style>
.pic {
	height: 20%;
	width: 15%;
}

.alcoholPic {
	height: 70%;
	width: 50%;
}
</style>

<meta charset="UTF-8">
<title>User page</title>
</head>
<body>
	<h1>User page</h1>
	<div class="pic">
		<c:choose>
			<c:when test="${account.getPicture()  != null}">
				<img src="${account.getPicture() }" class="alcoholPic">
			</c:when>
			<c:otherwise>
				<img src="noProfile.jpg" class="alcoholPic">
			</c:otherwise>
		</c:choose>
	</div>
	${account.getUser_Name() } ${account.getFirst_Name() }
	${account.getLName() } ${account.getEmail() } ${account.getBio() }
<h1><a href="favorites?id=${account.getId()}">Favorites</a></h1>
	${account.getLikes() }
	
	
</body>
</html>