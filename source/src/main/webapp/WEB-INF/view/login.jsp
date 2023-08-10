<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
<!-- 경고창 띄우기 위한 방법 -3 -->
<jsp:include page="/WEB-INF/view/msg.jsp"/>
<h1>로그인</h1>
    <form action="<%=request.getContextPath() %>/login" method="post">
        아이디: <input type="text" name="loginId"><br>
        비밀번호: <input type="password" name="loginPw"><br>
        <input type="submit" value="로그인">
    </form>
    <form action="<%=request.getContextPath() %>/join" method="get">
        <input type="submit" value="회원가입" >
       
    </form>
</body>
</html>