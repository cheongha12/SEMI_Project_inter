<%@page import="java.sql.Connection"%>
<%@page import="kh.semi.inter.model.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원관리</title>
</head>
<body>
<%
		// DB연동
	MemberDAO dao = MemberDAO.getInstance();
	Connection conn = dao.getConnection();
	out.print("DBCP 연동 성공");
	%>
</body>
</html>