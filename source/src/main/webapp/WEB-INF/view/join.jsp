<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
        // 아이디 중복 체크 함수
        function checkIdDuplication() {
            var loginId = document.getElementById("loginId").value;
            if (loginId === "") {
                alert("아이디를 입력하세요.");
                return;
            }
            // 아이디 중복 체크 로직 수행
          
            // AJAX 요청
            $.ajax({
                type: "POST",
                url: "idCheckServlet", // 아이디 중복 체크를 처리하는 서블릿 URL
                data: { loginId: loginId },
                success: function(result) {
                    if (result === "true") {
                        alert("사용 가능한 아이디입니다.");
                    } else {
                        alert("이미 사용 중인 아이디입니다.");
                    }
                }
            });
        
        
        }
    </script>
</head>
<body>
<!-- 경고창 띄우기 위한 방법 -3 -->
<%-- <jsp:include page="/WEB-INF/view/msg.jsp"/> --%>

 <h2>회원 가입</h2>
    <form action="${pageContext.request.contextPath }/join" method="post">
        아이디: <input type="text" name="loginId"><br>
        <button type="button" onclick="checkIdDuplication()">중복 체크</button><br>
        비밀번호: <input type="password" name="loginPw"><br>
        이름: <input type="text" name="name"><br>
        이메일: <input type="email" name="email"><br>
        전화번호: <input type="text" name="phone"><br>
	    <input type="submit" value="가입">
    </form>
</body>
</html>