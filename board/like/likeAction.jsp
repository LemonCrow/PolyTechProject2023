<%@ page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"%>
<%@ include file="../../db/Connection.jsp" %>
<%
		int boardIdx = Integer.parseInt(request.getParameter("board_idx"));
		String userNickname = (String) session.getAttribute("user_nickname");
		int userIdx = (int) session.getAttribute("user_idx");
			
			
	    /* 좋아요 클릭시  */
	    String sql = "INSERT INTO likey_tb (user_idx, board_idx) VALUES(?, ?)";
	    pstmt = conn.prepareStatement(sql);
	    pstmt.setInt(1, userIdx);
	    pstmt.setInt(2, boardIdx);
	    pstmt.executeUpdate();
	        	
	%>
	<script>
        alert("좋아요를 누르셨습니다.");
        location.href="/View.jsp";
    </script>