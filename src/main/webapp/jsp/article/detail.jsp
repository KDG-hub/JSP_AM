<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% Map<String,Object>articlerow = (Map) request.getAttribute("articlerow");  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1><%= (int) articlerow.get("id")%>번 게시글</h1>
	<div>게시글 번호 : <%= (int) articlerow.get("id") %></div>
	<div>작성 날짜 :<%= (LocalDateTime) articlerow.get("regDate") %></div>
	<div>제목 : <%= (String)articlerow.get("title")%></div>
	<div>내용 : <%= (String) articlerow.get("body")%></div>
	<div><a href="list">목록</a></div>
</body>
</html>