<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
</head>
<body>
	<form method="post" action="${pageContext.request.contextPath }/memberupdate" name="frm">
	<%-- <form method="post" name="withdrawal" action="${pageContext.request.contextPath }/WithDrawal" name="frm"> --%>
		<table align="center" width="600">
			<tr>
				<td colspan="2">My Page</td>
			</tr>
			<tr>
				<td>아이디</td>
				<%-- <td><input type="text" name="id" value="${loginUser.id }" ></td> 리드온리 읽기만 가능 --%> 
				<td><input type="text" name="loginId" value="${loginInfo.loginId}" readonly="readonly"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="loginPw" value="${loginInfo.loginPw}"></td>
			</tr>
			<tr>
				<td>이름</td>
				<%-- <td><input type="text" name="name" value="${loginUser.name }"></td> --%>
				<td><input type="text" name="name" value="${loginInfo.name}"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email1" value = "${email1}">
				<select id = "email2" name="email2">						
					<option value="@naver.com">@naver.com</option>
					<option value="@gmail.com" >@gmail.com</option>
					<option value="@hanmail.com" >@hanmail.com</option>
					<option value="@kh.com" >@kh.com</option>
				</select></td>
			</tr>
			
			<tr>
				<td>PHONE</td>
				<td><input type="text" name="phone" value="${loginInfo.phone}"></td>
			</tr>
			<tr align="center">
			<td colspan="3"><input type="submit" value="회원정보수정">&nbsp; <input type="submit" name="withdrawal" value="회원탈퇴"> &nbsp; <input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</body>
</html>