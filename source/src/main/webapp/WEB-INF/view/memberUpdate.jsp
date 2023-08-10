<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>회원가입 리스트</title>
</head>
<body>
    <table border="1">
        <tr>
            <th>아이디</th>
            <th>이름</th>
            <th>이메일</th>
            <th>전화번호</th>
        </tr>
        <c:forEach items="${registrationList}" var="member">
            <tr>
                <td><c:out value="${member.loginId}" /></td>
                <td><c:out value="${member.name}" /></td>
                <td><c:out value="${member.email}" /></td>
                <td><c:out value="${member.phone}" /></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
