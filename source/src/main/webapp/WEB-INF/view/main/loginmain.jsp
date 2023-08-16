<link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/join.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
</head>
<body>
<jsp:include page="/WEB-INF/view/header/header.jsp"/>
<jsp:include page="/WEB-INF/view/login/login.jsp"/> 
<jsp:include page="/WEB-INF/view/footer/footer.jsp"/>


</body>
</html>