package com.koreaIT.java.am;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/home/printDan2")
public class HomeMainServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		String inputDan = request.getParameter("dan");
		String inputLimit = request.getParameter("limit");
		String color = request.getParameter("color");		
		
		int dan = Integer.parseInt(inputDan);
		int limit =Integer.parseInt(inputLimit);
		
		if(inputDan == null) {
			inputDan = "1";
		}
		if(inputLimit == null) {
			inputLimit = "1";	
		}
		if(color == null) {
			color = "black";
		}
		
		response.getWriter().append(String.format("<div style = \"color : %s;\">==%d단==<br /></div>",color,dan));
		
		for(int i =0; i<limit; i++) {
			response.getWriter().append(String.format("<div style = \"color : %s;\">%d * %d = %d</div>",color, dan, limit, dan*limit));
		}
		
	}
}
