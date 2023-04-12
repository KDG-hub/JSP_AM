<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% List<Map<String,Object>>memberMap = (List<Map<String, Object>>) request.getAttribute("memberMap"); %>

<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
	<script type="text/javascript">
	 function jbSubmit(form) {	
		 
		 	form.loginId.value = form.loginId.value.trim();
		 	form.loginPw.value = form.loginPw.value.trim();
		 	form.loginPwChk.value = form.loginPwChk.value.trim();
		 	form.memberName.value = form.memberName.value.trim();
		 	
		 	var loginId = document.getElementById('loginId').value; 
	        var pw1 = document.getElementById( 'pw1' ).value;
	        var pw2 = document.getElementById( 'pw2' ).value;
	        
			if(form.loginId.value.length == 0){
				alert('아이디를 입력해주세요');
				form.loginId.focus();
				return;
			}
			
			if(form.loginPw.value.length == 0){
				alert('비밀번호를 입력해주세요');
				form.loginPw.focus();
				return;
			}
	        form.submit();
	      }
	</script>
</head>
<body>
	<h1><a href="../home/main">메인</a></h1>
	<h1>로그인</h1>
	
	<form action ="dologin" method="post" onsubmit="jbSubmit(this); return false;">
		<div>
			로그인 아이디 : <input name= "loginId" type="text" placeholder="userId" required id = "loginId" autocomplete="off"/>
		</div>
		<div>
			로그인 비밀번호 : <input name= "loginPw" type="password" placeholder="Password" required id ="pw1" autocomplete="off"/>
		</div>
		<button>로그인</button>
	</form>
	<div><a href="join">회원가입</a></div>
</body>
</html>