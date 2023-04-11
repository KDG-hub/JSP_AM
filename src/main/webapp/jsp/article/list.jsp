<%@page import="com.koreaIT.java.am.util.Util"%>
<%@page import="java.time.LocalDateTime"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	List<Map<String, Object>> articleListMap = (List<Map<String, Object>>) request.getAttribute("articleListMap");
	request.getAttribute("page");
	int Page = (int) request.getAttribute("page");
	int totalPage = (int) request.getAttribute("totalPage");
	int from = (int) request.getAttribute("from");
	int end = (int) request.getAttribute("end");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 리스트</title>
</head>
<body>
	<h1><a href="../home/main">메인</a></h1>
	<h1>게시물 리스트</h1>
	<div><a href="write">게시글 작성</a></div>
	
		<table border = "1">
			<colgroup>
				<col width="50"/>
				<col width="200"/>
			</colgroup>
			<tr>
				<th>번호</th>
				<th>날짜</th>
				<th>제목</th>	
			</tr>
			<% 
			for(Map<String, Object> articleMap : articleListMap) {
			%>
			<tr>
				<td><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("id") %></a></td>
				<td><a href="detail?id=<%= articleMap.get("id") %>"> <%= Util.datetimeFormat((LocalDateTime)articleMap.get("regDate")) %></a></td>
				<td><a href="detail?id=<%= articleMap.get("id") %>"><%= articleMap.get("title") %></a></td>
			</tr>	
			<% 
			} 
			%>
		</table>
		
		<style type="text/css">
			.page > a.red{
				color : red;
			}
		</style>
		
		<div class ="page">
			<%
			if (Page > 1) {
			%>
			<a href="list?page=1">◀</a>
			<% 
			}
			%>
			<%
			for (int i = from; i <= end; i++) { 
			%>
			<a class ="<%=Page == i ? "red" : ""%> " href="list?page=<%=i %>"><%=i %></a>
			<%
			} 
			%>
			<%
			if (Page < totalPage) {
			%>
			<a href="list?page=<%= totalPage %>">▶</a>
			<% 
			}
			%>
		</div>	
</body>
</html>