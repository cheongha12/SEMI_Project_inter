<link href="${pageContext.request.contextPath }/resources/css/reset.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/header.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/boby.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/mainlogin.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/resources/css/footer.css" rel="stylesheet">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Bootstrap JS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
  
  <!-- Swiper JS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />
  <script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
  
  <title>로그인</title>
  
</head>
<body>
<!-- 경고창 띄우기 위한 방법 -3 -->
<jsp:include page="/WEB-INF/view/msg.jsp"/>

<jsp:include page="/WEB-INF/view/header/header.jsp"/>
 
	<h1 class="login2">로그인</h1>
    <form action="<%=request.getContextPath() %>/login" method="post" class="login" >
        아이디  : <input type="text" name="loginId" ><br>
        비밀번호: <input type="password" name="loginPw" ><br>
        <input type="submit" value="로그인">
    </form>
    <form action="<%=request.getContextPath() %>/join" method="get" class="login1" >
        <input type="submit" value="회원가입" >
    </form>
    

<jsp:include page="/WEB-INF/view/footer/footer.jsp"/>

</body>

</html>