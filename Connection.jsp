<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
    // db 연결 코드
    String driver = "org.mariadb.jdbc.Driver";
    String IP = "poly0411.cafe24.com";
    String PORT = "3306";
    String ID = "poly0411";
    String PWD = "poly0411@@";
    String DB_NAME = "poly0411";
    
    String DB_URL = "jdbc:mariadb://localhost/poly0411";
    
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    String testMsg = null;
    String sql = "insert into test_db values(?)";
    // 예외처리 코드
    try {
    	Class.forName("org.mariadb.jdbc.Driver");
        conn = DriverManager.getConnection(DB_URL, ID, PWD);
        if (conn != null) {
            System.out.println("DB 접속 성공");
            testMsg = "연결 성공~~";
            pstmt = conn.prepareStatement(sql);
    		pstmt.setInt(1, 3);
    		rs = pstmt.executeUpdate();
        }
        else{
        	testMsg = "연결 실패~~";
        }
    } catch (ClassNotFoundException e) {
        System.out.println("드라이버 로드 실패");
        e.printStackTrace();
    } catch (SQLException e) {
        System.out.println("DB 접속 실패");
        e.printStackTrace();
    }
%>