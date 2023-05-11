<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="Connection.jsp" %>

 <%
    try{
        
        String sql = "SELECT * FROM user_tb WHERE user_id = ? and user_passwd = ?";
        
        pstmt = conn.prepareStatement(sql);
        String user_id = request.getParameter("user_id");
        String user_passwd = request.getParameter("user_passwd");
        
        pstmt.setString(1, user_id);
        pstmt.setString(2, user_passwd);
        rs = pstmt.executeQuery();
		
		if(rs.next()){
			int idx = rs.getInt("user_idx");
			user_id = rs.getString("user_id");
			user_passwd = rs.getString("user_passwd");
		
			session.setAttribute("user_passwd", user_passwd);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_idx", idx);
			response.sendRedirect("index.jsp");
		}else{
			%>
			<script>
			alert('로그인 오류1');
			</script>
			<%
			/* response.sendRedirect("login.jsp"); */
		}
		
		
	}catch(Exception e){
		%>
		<script>
		alert('로그인 오류2');
		</script>
		<%
		out.println("예외 메시지: " + e.getMessage());
		e.printStackTrace();
		/* response.sendRedirect("login.jsp"); */
		
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
%>
