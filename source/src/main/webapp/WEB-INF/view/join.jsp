<%@page import="kh.semi.inter.model.DAO.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
</head>
<body>
<jsp:include page="/WEB-INF/view/msg.jsp"/>

<h2 class="header">회원 가입</h2>

<form action="${pageContext.request.contextPath }/join" method="post" class="joinup">
	<div class="flex">
	<div class="textfield">아이디: </div>
	<input type="text" name="loginId" >
	
    <span id="id_message"></span>
    
    <button type="button" class="id_check" name="id_check" >중복 체크</button><br>
    </div>
    
    <div class="flex">
    <div class="textfield">비밀번호: </div>
    <input type="password" name="loginPw"><br>
    </div>
    
    <div class="flex">
    <div class="textfield">이름  : </div>
    <input type="text" name="name"><br>
    </div>
    
    <div class= "flex">
    <div class="textfield">이메일 : </div>
    <input type="email" name="email"><br>
    </div>
    
    <div class= "flex">
    <div class="textfield">전화번호: </div>
    <input type="text" name="phone"><br>
    </div>
    
    <div class="btn">
    <input type="submit" value="가입" class="join">
	</div> 
</form>

<script>
$('.id_check').click(function() {
    if ($('input[name="loginId"]').val().length == 0) {
        alert("아이디를 입력하세요");
        return;
    }

    $.ajax({
        url: "${pageContext.request.contextPath}/idCheckServlet",
        type: "get",
        data: {
            loginId: $('input[name="loginId"]').val()
        },
        success: function(result) {
            console.log("success");
            if (result === 'YES') {
                // 중복된 아이디가 없을 시 처리
                $('#id_message').text('사용 가능한 아이디입니다.');
                alert($('#id_message').text());
            } else {
                // 중복된 아이디가 있을 시 처리
                $('#id_message').text('이미 사용 중인 아이디입니다.');
                alert($('#id_message').text());
            }
        }
    });
});
</script>
</body>
</html>