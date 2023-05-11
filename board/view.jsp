<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../db/Connection.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1" >  <!-- 반응형 웹에 사용하는 메타태그 -->
<title>게시판</title>
<style type="text/css"> /* 게시판 위쪽 메인 게시판 부분 글씨 색 처리 */
	a.over{
		color: #000000;
		text-decoration: none;
	} 
</style>
<%	
		

    int boardIdx = Integer.parseInt(request.getParameter("idx"));
	
	// 현재 로그인한 사용자 정보 조회
    String userNickname = (String) session.getAttribute("user_nickname");
    int userIdx = (int) session.getAttribute("user_idx");
	
 	// 조회수 증가
    PreparedStatement pstmt0 = null;
    ResultSet rs0 = null;
    int viewCount = 0;
    
 	// 게시글 정보 조회
    PreparedStatement pstmt1 = null;
    ResultSet rs1 = null;
    
    // 좋아요 갯수 확인
    PreparedStatement pstmt2 = null;
    ResultSet rs2 = null;
    
 	// 좋아요 누르기
    PreparedStatement pstmt3 = null;
    ResultSet rs3 = null;
	
    try {
    	String sql0 = "UPDATE board_tb SET board_view_count = board_view_count + 1 WHERE board_idx = ?";
        pstmt0 = conn.prepareStatement(sql0);
        pstmt0.setInt(1, boardIdx);
        pstmt0.executeUpdate();

        String sql1 = "SELECT board_title, board_content, board_view_count FROM board_tb WHERE board_idx = ?";
        pstmt1 = conn.prepareStatement(sql1);
        pstmt1.setInt(1, boardIdx);
        rs1 = pstmt1.executeQuery();
     	// rs1에서 게시글 정보 가져와서 화면에 출력
		
     	//게시글 좋아요 총 갯수
        String sql2 = "SELECT COUNT(board_idx) FROM likey_tb WHERE board_idx = ?";
        pstmt2 = conn.prepareStatement(sql2);
        pstmt2.setInt(1, boardIdx);
        rs2 = pstmt2.executeQuery();
    	
        // 좋아요 클릭시
        String sql3 = "SELECT COUNT(*) FROM like_tb WHERE board_idx=? AND user_idx=?";
        pstmt3 = conn.prepareStatement(sql3);
        pstmt3.setInt(1, boardIdx);
        pstmt3.setInt(2, userIdx);
        rs3 = pstmt3.executeQuery();

        boolean alreadyLiked = false;
        if (rs3.next() && rs3.getInt(1) > 0) {
            alreadyLiked = true;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
    	
    }
        // Close the database resources
%>
</head>
<body>
  <a href="../index.jsp" class="over"><h4>Home</h4></a>
  <a href="boardmain.jsp" class="over"><h4>게시판</h4></a>
  <% if(rs1.next()){ %>
  <table>
  	<thead border="1">
  	<tr>
  		<th>번호</th>
  		<th>제목</th>
  		<th>작성자</th>
  		<th>조회수</th>
  		<th>좋아요</th>
  	</tr>
  </thead>
  <tbody border="1">
  	<tr>
  		<td><%=boardIdx%></td>
  		<td><%=rs1.getString("board_title") %></td>
  		<td><%=rs1.getString("board_content") %></td>
  		
  		<td><%=rs1.getInt("board_view_count") %></td>  
  		<%} %>
  		<% if(rs2.next()){ %>
  		<td><%=rs2.getInt("COUNT(board_idx)") %></td>
  		<%} %>
  	</tr>
  </tbody>
<% 
    boolean LikeButton = true; // 좋아요 버튼
    if (rs3 != null && rs3.next() && rs3.getInt(1) > 0) {
        // 좋아요를 누른 적이 있으면 좋아요 안올라가기
        LikeButton = false;
    }
%>
<% if (LikeButton) { %>
    <tfoot>  
        <form method="post" action="like/likeAction.jsp" style="text-align: center">
            <input type="hidden" value="<%=boardIdx %>" name="board_idx">
            <button>Like</button>
        </form>
    </tfoot>
<% } 
    try {
        if (rs1 != null) rs1.close();
        if (pstmt1 != null) pstmt1.close();
        if (rs2 != null) rs2.close();
        if (pstmt2 != null) pstmt2.close();
        if (rs3 != null) rs3.close();
        if (pstmt3 != null) pstmt3.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
    	
    }
%>
</table>
</body>
</html>

  