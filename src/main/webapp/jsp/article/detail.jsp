<%@page import="com.koreaIT.java.am.util.Util"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% 
	Map<String,Object>articlerow = (Map) request.getAttribute("articlerow"); 
	int loginedMemberId =(int) request.getAttribute("loginedMemberId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세보기</title>
</head>
<body>
	<h1><a href="../home/main">메인</a></h1>
	<h1><%= (int) articlerow.get("id")%>번 게시글</h1>
	<div>게시글 번호 : <%= (int) articlerow.get("id") %></div>
	<div>작성자 : <%= (String)articlerow.get("writerName")%></div>
	<div>작성 날짜 :<%= Util.datetimeFormat((LocalDateTime)articlerow.get("regDate")) %></div>
	<div>제목 : <%= (String)articlerow.get("title")%></div>
	<div>내용 : <%= (String) articlerow.get("body")%></div>
	<div>
		<a href="list">목록</a>
	</div>
	<div>
		<%if(loginedMemberId != -1 && loginedMemberId == (int)articlerow.get("memberId")){%>
		<a href="delete?id=<%= (int) articlerow.get("id") %>" onclick = "if(confirm('정말 삭제하시겠습니까?') == false) return false;">게시글 삭제</a>
		<a href="modify?id=<%= (int) articlerow.get("id") %>">게시글 수정</a>
		<%} %>
	</div>
</body>
</html>