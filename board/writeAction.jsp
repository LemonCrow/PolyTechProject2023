<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.util.*" %>
<%@ page import="java.io.*" %>

<% 

    String user_nickname = (String)session.getAttribute("user_nickname");
    int user_idx = (int)session.getAttribute("user_idx");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
    

    try {
            String sql = "INSERT INTO board_tb (user_nickname, user_idx,  board_title, board_content, board_reg_date, board_view_count) VALUES (?, ?, ?, ?, NOW(), 0)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user_nickname);
            pstmt.setInt(2, user_idx);
            pstmt.setString(3, title);
            pstmt.setString(4, content);
            pstmt.executeUpdate();
            
            response.sendRedirect("boardmain.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    %>
    