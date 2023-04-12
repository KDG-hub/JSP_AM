<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% List<Map<String,Object>>memberMap = (List<Map<String, Object>>) request.getAttribute("memberMap"); %>

<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
	<script type="text/javascript">
	 function jbSubmit(form) {	
		 
		 	form.loginId.value = form.loginId.value.trim();
		 	form.loginPw.value = form.loginPw.value.trim();
		 	form.loginPwChk.value = form.loginPwChk.value.trim();
		 	form.memberName.value = form.memberName.value.trim();
		 	
		 	var loginId = document.getElementById('loginId').value; 
	        var pw1 = document.getElementById( 'pw1' ).value;
	        var pw2 = document.getElementById( 'pw2' ).value;
	        
	        if ( form.loginPwChk.value != form.memberName.value ) {
	          alert( '패스워드를 확인해주세요' );
	          form.loginPw.focus();
	          return;
	        }
	        form.submit();
	      }
	</script>
</head>
<body>
	<h1>회원가입</h1>
	
	<form action ="dojoin" method="post" onsubmit="jbSubmit(this); return false;">
		<div>
			아이디 : <input name= "loginId" type="text" placeholder="userId" required id = "loginId" autocomplete="off"/>
		</div>
		<div>
			비밀번호 : <input name= "loginPw" type="password" placeholder="Password" required id ="pw1" autocomplete="off"/>
		</div>
		<div>
			비밀번호 확인 : <input name= "loginPwChk" type="password" placeholder="Confirm Password" required id = "pw2" autocomplete="off" />
		</div>
		<div>
			이름 : <input type="text" name="memberName" placeholder="userName" required/>
		</div>		
		<button>가입</button>
	</form>
	<div><a href="../home/main">취소</a></div>
</body>
</html>