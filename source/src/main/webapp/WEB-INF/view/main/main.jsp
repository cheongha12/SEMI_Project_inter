<link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/boby.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet">

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Swiper JS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  <title>Document</title>
  
</head>
<body>
<!-- 경고창 띄우기 위한 방법 -3 -->
<jsp:include page="/WEB-INF/view/msg.jsp"/>

<jsp:include page="/WEB-INF/view/header/header.jsp"/>

<jsp:include page="/WEB-INF/view/boby/boby.jsp"/>

<jsp:include page="/WEB-INF/view/footer/footer.jsp"/>

</body>

</html>