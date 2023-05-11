<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>
<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="javax.servlet.*"%>
<script type="text/javascript">
	        int likey_idx = Integer.parseInt(request.getParameter("likey_idx"));

	        try {
	            Connection conn = DBConnect.getConnection();
	            // 게시글 좋아요 수 증가 해야함
	            PreparedStatement pstmt = conn.prepareStatement
	            ("UPDATE likey_idx SET likes = likes + 1 WHERE id = ?");
	            pstmt.setInt(1, postId);
	            pstmt.executeUpdate();
	            pstmt.close();

	            // 증가된 좋아요 수 가져오기
	            pstmt = conn.prepareStatement
	            // 개시글 좋아요 총 갯수 가져오기
	            ("SELECT COUNT(*) AS count FROM lieky_post_tb WHERE board_idx = ? AND likey_idx IS NOT NULL;");
	            pstmt.setInt(1, board_idx);
	            ResultSet rs = pstmt.executeQuery();
	            int count = 0;
	            if (rs.next()) {
	            	count = rs.getInt("count");
	            }
	            rs.close();
	            pstmt.close();
	            conn.close();

	            // 게시글 상세 페이지로 이동
	            //response.sendRedirect("detail.jsp?postId=" + postId + "&likes=" + likes);
	        //} catch (SQLException | ClassNotFoundException e) {
	            //e.printStackTrace();
	        }
	    }
	}
</script>