<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Information</title>
</head>
<body>
	<form method="post" action="UpdateServlet" name="frm">
		<table align="center" width="600">
			<tr>
				<td colspan="2">My Page</td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${loginUser.id }" readonly="readonly"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${loginUser.name }"></td>
			</tr>
			<tr>
				<td>이메일</td>
				
				<td><select name="email">
						<c:choose>
						
							<c:when test="${result == 4 }">
								<option value="A" selected="selected">@naver.com</option>
								<option value="B">@gmail.com</option>
								<option value="C">@hanmail.com</option>
								<option value="D">@kh.com</option>
							</c:when>
							<c:otherwise>
								<option value="A">@naver.com</option>
								<option value="B" selected="selected">@gmail.com</option>
								<option value="C" selected="selected">@hanmail.com</option>
								<option value="D" selected="selected">@kh.com</option>
							</c:otherwise>
						</c:choose>
				</select></td>
			</tr>
			
			<tr>
				<td>PHONE</td>
				<td><input type="text" name="phone" value="${loginUser.phone }"></td>
			</tr>
			<tr align="center">
			<td colspan="2"><input type="submit" value="회원정보수정"> &nbsp; <input type="reset" value="취소"></td></tr>
		</table>
	</form>
</body>
</html>