<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>환영합니다 로그인에 성공하였습니다.</h2>


<script>
	/* var msg = '${msg}';
	if(msg){
		alert(msg);
	} */
</script>

<c:choose>
	<c:when test="${not empty loginId }">
<a href="${pageContext.request.contextPath}/logout">로그아웃</a>
	</c:when>
	</c:choose>
</body>
</html>