<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% int loginedMember =(int) request.getAttribute("loginedMember"); %>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
</head>
<body>
	<h1>메인 페이지</h1>
	<%
	if(loginedMember == -1){
	%>
		<div><a href="../member/join">회원가입</a></div>
		<div><a href="../member/login">로그인</a></div>
	<%
	}
	%>
	<%
	if(loginedMember != -1){
	%>
		<div><a href="../member/logout">로그아웃</a></div>
	<%
	}
	%>	
	<div><a href="../article/list">게시물 리스트</a></div>
</body>
</html>