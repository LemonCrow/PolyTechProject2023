<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../db/Connection.jsp" %>

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
			int user_idx = rs.getInt("user_idx");
			user_id = rs.getString("user_id");
			user_passwd = rs.getString("user_passwd");
			String user_nickname = rs.getString("user_nickname");
			String user_name = rs.getString("user_name");
			Date user_birth = rs.getDate("user_birth");
			String user_phoneNum = rs.getString("user_phoneNum");
			String user_email = rs.getString("user_email");
			String user_gender = rs.getString("user_gender");
			String user_friend_code = rs.getString("user_friend_code");
			String user_sns_facebook = rs.getString("user_sns_facebook");
			String user_sns_twitter = rs.getString("user_sns_twitter");
			String user_sns_instargram = rs.getString("user_sns_instargram");
		
			session.setAttribute("user_passwd", user_passwd);
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_idx", user_idx);
			session.setAttribute("user_friend_code", user_friend_code);
			session.setAttribute("user_nickname", user_nickname);
			session.setAttribute("user_name", user_name);
			session.setAttribute("user_birth", user_birth);
			session.setAttribute("user_phoneNum", user_phoneNum);
			session.setAttribute("user_email", user_email);
			session.setAttribute("user_gender", user_gender);
			session.setAttribute("user_friend_code", user_friend_code);
			session.setAttribute("user_sns_facebook", user_sns_facebook);
			session.setAttribute("user_sns_twitter", user_sns_twitter);
			session.setAttribute("user_sns_instargram", user_sns_instargram);
			response.sendRedirect("../index.jsp");
		}else{
			%>
			<script>
			alert('로그인 오류1');
			</script>
			<%
			 response.sendRedirect("Login.jsp"); 
		}
		
		
	}catch(Exception e){
		%>
		<script>
		alert('로그인 오류2');
		</script>
		<%
		out.println("예외 메시지: " + e.getMessage());
		e.printStackTrace();
		 response.sendRedirect("Login.jsp"); 
		
	}finally{
		if(pstmt != null) try{pstmt.close();} catch(SQLException ex){}
		if(conn != null) try{conn.close();} catch(SQLException ex) {}
	}
%>
