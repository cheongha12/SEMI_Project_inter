<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form name="join" method="post" action="/join">
		<p id="text">사용할 수 있는 아이디입니다.</p>
		<P>
			<label>아이디<input type="text" name="userid"></label>
			<input type="button" value="중복확인" onclick="">
		</P>
		
		<p>
			<label>비밀번호 <input type="password" name="userpw"></label>
		</p>
		<p>
			<label>비밀번호확인 <input type="password" name="userpw_re"> </label>
		</p>
		<p>
			<label>이름 <input type="text" name="username"> </label>
		</p>
		
		<p>
			<label>핸드폰 번호 <input type="text" name="userphone"></label>
		</p>
		
		<p>
			<input type="button" value="가입완료" onclick="sendit()">
		</p>
	</form>
</body>
<script type="text/javascript" src="user.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</html>