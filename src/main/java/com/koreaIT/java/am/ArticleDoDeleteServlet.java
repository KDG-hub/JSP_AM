package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Map;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/article/delete")
public class ArticleDoDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html; charset = UTF-8;");
		
		int id = Integer.parseInt(request.getParameter("id"));
		
		Connection conn = null;
		try {
			Class.forName(Config.getDBDriverName());

			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUserName(), Config.getDBPassword());
			
			SecSql sql = SecSql.from("SELECT * FROM article");
			sql.append("WHERE id = ?",id);
			
			Map<String, Object> articlerow = DBUtil.selectRow(conn, sql);
			
			request.setAttribute("articlerow", articlerow);
			
			if (articlerow.isEmpty()) {
				response.getWriter().append(String.format("<script>alert('%d 게시글은 존재하지 않습니다.'); location.replace('list');</script>",id));
				return;
			}
			
			HttpSession session = request.getSession();
			
			int loginedMemberId = -1;

			if (session.getAttribute("loginedMemberId") != null) {
				loginedMemberId = (int) session.getAttribute("loginedMemberId");
			}
			
			if(loginedMemberId == -1) {
				response.getWriter().append(String.format("<script>alert('로그인 후 이용해주세요'); location.replace('../member/login');</script>"));
				return;
			}
			
			if (session.getAttribute("loginedMemberId") != articlerow.get("memberId")) {
				response.getWriter().append(String.format("<script>alert('해당 게시글에 관한 권한이 없습니다.'); location.replace('detail?id=%d');</script>",id));
				return;
			}
			
			sql = SecSql.from("DELETE FROM article");
			sql.append("WHERE id = ?",id);
			
			DBUtil.delete(conn, sql);
			
			response.getWriter().append(String.format("<script>alert('%d번 글이 삭제 되었습니다.'); location.replace('list');</script>", id));
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로딩 실패");
		} catch (SQLException e) {
			System.out.println("에러: " + e);
		} finally {
			try {
				if (conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
