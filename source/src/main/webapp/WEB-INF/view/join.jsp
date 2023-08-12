<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--   <%String loginId = request.getParameter("loginId");
  
  
  %>
  <jsp:useBean id="dao" class="MemberDAO"/> --%>
  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
       $('id_check').click(function(){
    	   if($('input[name="loginId"]')vla.().length == 0){
    		   alert("아이디를 입력하세요");
    		   return;
    	   }
    	$.ajax({//화면을 이동하지 않고서도 특정한것을 요청 할수있음
    	//어디에 처리를 요청할것인지	
    	url :"서블릿주소",
    	//요청시 함꼐 넘겨줄 데이터
    	data : {
    		loginId : $('input[name=id]').val()//왼쪽에 위취한 변수는 내가 임의로 가능
    		//이후에 서블릿주소에서 requrst.getparmater("loginId")로 접근가능
    	},
    	success : function(responseData){
    		//인자에는 응답정보가 오는데 서블릿의주소의 실행값이 넘어옴.
    		//주석같은것도 같이 날라오기 떄문에 서블릿의주소값에는 주석을 달면안됨
    		alert('data: ' + $.trim(responseDate));
    		if($.trim(responseData)== 'YES'){ // 앞뒤에는 붙은 공백을 제거해주고 비교해야함
    			$('#id_message').html("<font color=blue>사용 가능합니다."</font>");
    			$('#id_message').show();
    			use = "possible";
    			
    		}else {
    			$('#id_message').html("<font color=red>이미 사용중인 아이디 입니다."</font>");
    			$('#id_message').show();
    			use = "possible";
    		}
    	} //succes
    	}); //ajax
       });
    </script>
</head>
<body>
<!-- 경고창 띄우기 위한 방법 -3 -->
<jsp:include page="/WEB-INF/view/msg.jsp"/>

 <h2>회원 가입</h2>
    <form action="${pageContext.request.contextPath }/join" method="post">
        아이디: <input type="text" name="loginId">
        <button type="button" name="id_check" onclick="checkIdDuplication()">중복 체크</button><br>
        비밀번호: <input type="password" name="loginPw"><br>
        이름: <input type="text" name="name"><br>
        이메일: <input type="email" name="email"><br>
        전화번호: <input type="text" name="phone"><br>
	    <input type="submit" value="가입">
    </form>
</body>
</html>