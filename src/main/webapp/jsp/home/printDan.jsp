<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 스크립틀릿 -->
<%
	String inputDan = request.getParameter("dan");
	String inputLimit = request.getParameter("limit");
	String color = request.getParameter("color");

	
	if(inputDan == null) {
		inputDan = "1";
	}
	if(inputLimit == null) {
		inputLimit = "1";	
	}
	if(color == null) {
		color = "red";
	}
	
	int dan = Integer.parseInt(inputDan);
	int limit = Integer.parseInt(inputLimit);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 출력</title>
</head>
<body>
	<div style = "color : <%= color %>;">==<%= dan%>단==</div>
	<div><% for(int i = 1; i<=limit; i++){%>
			<div style = "color:<%=color %>;" ><%=dan %> * <%= i %> = <%= dan* i %></div>
		<%}%></div>
</body>
</html>