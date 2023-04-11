<%@page import="com.koreaIT.java.am.util.Util"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% Map <String,Object>articlerow = (Map) request.getAttribute("articlerow");  %>

<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
</head>
<body>
	<h1>게시글 수정</h1>
	
	<form action ="domodify" method="POST">
		<h1><%= (int) articlerow.get("id")%>번 게시글</h1>
		<input type="hidden" name="id" value="<%= (int) articlerow.get("id") %>" />
		<div>게시글 번호 : <%= (int) articlerow.get("id") %></div>
		<div>작성 날짜 :<%= Util.datetimeFormat((LocalDateTime)articlerow.get("regDate")) %></div>
		<div>제목 : <input name= "title" type="text" value="<%= (String)articlerow.get("title")%>"/>
		</div>
		<div>내용 : <textarea name="body"><%= (String) articlerow.get("body")%></textarea>
		</div>
		<div>
			<button>수정</button>
			<a href="detail?id=<%= (int) articlerow.get("id") %>">취소</a>
		</div>
	</form>
	<div><a href="list">목록</a></div>
	
</body>
</html>