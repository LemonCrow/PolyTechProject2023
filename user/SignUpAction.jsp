<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ include file="../db/Connection.jsp" %>
<%
    // 첫 번째 이메일 입력란의 값을 가져옴
    String user_email1 = request.getParameter("user_email1");
    
    // 두 번째 이메일 입력란의 값을 가져옴
    String user_email2 = request.getParameter("user_email2");
    
    // 이메일 주소 합치기
    String user_email = user_email1 + "@" + user_email2;
    
    // 세션에 이메일 주소 저장
    session.setAttribute("user_email", user_email);
%>
<%

// 친구코드 생성 중복X
int friendCode = 0;
boolean isFriendCodeExists = true;
while (isFriendCodeExists) {
    // 4자리 난수 생성
    friendCode = (int)(Math.random() * 9000) + 1000;
    try {
        String sql = "SELECT COUNT(*) FROM user_tb WHERE user_friend_code=?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, friendCode);
        rs = pstmt.executeQuery();
        if (rs.next() && rs.getInt(1) == 0) {
            isFriendCodeExists = false;
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}

try {
    String sql = "INSERT INTO user_tb (user_id, user_passwd, user_name, user_nickname, user_birth, user_phoneNum, user_email, user_gender, user_friend_code, user_sns_facebook, user_sns_twitter, user_sns_instargram) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, request.getParameter("user_id"));
    pstmt.setString(2, request.getParameter("user_passwd"));
    pstmt.setString(3, request.getParameter("user_name"));
    pstmt.setString(4, request.getParameter("user_nickname"));
    pstmt.setString(5, request.getParameter("user_birth"));
    pstmt.setString(6, request.getParameter("user_phoneNum"));
    pstmt.setString(7, (String) session.getAttribute("user_email"));
    pstmt.setString(8, request.getParameter("user_gender"));
    pstmt.setInt(9, friendCode);
    pstmt.setString(10, request.getParameter("user_sns_facebook"));
    pstmt.setString(11, request.getParameter("user_sns_twitter"));
    pstmt.setString(12, request.getParameter("user_sns_instargram"));
    pstmt.executeUpdate();
    response.sendRedirect("../index.jsp");
} catch (SQLException e) {
    e.printStackTrace();
    response.sendRedirect("../index.jsp");
} finally {
    if (pstmt != null) {
        try {
            pstmt.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>SignUpAction</title>
</head>
<body>
<script>
				alert("회원가입 완료");
			    location.href="../index.jsp";
</script>

</body>
</html>