package com.koreaIT.java.am;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.koreaIT.java.am.config.Config;
import com.koreaIT.java.am.util.DBUtil;
import com.koreaIT.java.am.util.SecSql;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/member/dojoin")
public class MemberDoJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		
		response.setContentType("text/html; charset= UTF-8;");
		Connection conn = null;
		try {
			Class.forName(Config.getDBDriverName());

			conn = DriverManager.getConnection(Config.getDBUrl(), Config.getDBUserName(), Config.getDBPassword());

			String loginId = request.getParameter("loginId");
			String loginPw = request.getParameter("loginPw");
			String memberName = request.getParameter("memberName");
			
			SecSql sql = SecSql.from("SELECT COUNT(*) FROM `member`");
			sql.append("WHERE loginId = ?",loginId);
			int idDupChk = DBUtil.selectRowIntValue(conn, sql);
			
			if(idDupChk == 1) {
				response.getWriter().append(String.format("<script>alert('%s는 중복된 아이디입니다.'); location.replace('join');</script>", loginId));
				return;
			}

			sql = SecSql.from("INSERT INTO `member`");
			sql.append("SET regDate = NOW()");
			sql.append(", updateDate = NOW()");
			sql.append(", loginId = ?", loginId);
			sql.append(", loginPw = ?", loginPw);
			sql.append(", `memberName` = ?", memberName);

			DBUtil.insert(conn, sql);

			response.getWriter().append(String.format("<script>alert('%s님 환영합니다'); location.replace('../home/main');</script>", loginId));

			
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
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
