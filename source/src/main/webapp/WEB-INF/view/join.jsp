<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h2>회원 가입</h2>
    <form action="JoinServlet" method="post">
        아이디: <input type="text" name="loginId"><br>
        비밀번호: <input type="password" name="loginPw"><br>
        이름: <input type="text" name="name"><br>
        이메일: <input type="email" name="email"><br>
        전화번호: <input type="text" name="phone"><br>
        <input type="submit" value="가입">
    </form>
</body>
</html>