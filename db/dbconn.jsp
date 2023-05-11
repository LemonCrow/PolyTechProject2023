<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
// 	db 연결 코드
	String driver = "org.mariadb.jdbc.Driver";
	String IP = "poly0411.cafe24.com";
	String PORT = "3306";
	String ID = "poly0411";
	String PWD = "poly0411@@";
	String DB_NAME = "poly0411";
	
	String DB_URL = "jdbc:mariadb://" + IP + ":" + PORT + "/" +  DB_NAME +"?useUnicode=true&characterEncoding=UTF-8";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
// 	예외처리 코드
	try {
		Class.forName(driver);
		conn = DriverManager.getConnection(DB_URL, "poly0411", "poly0411");
		if (conn != null) {
			System.out.println("DB 접속 성공");
		}

	} catch (ClassNotFoundException e) {
		System.out.println("드라이버 로드 실패");
		e.printStackTrace();
	} catch (SQLException e) {
		System.out.println("DB 접속 실패");
		e.printStackTrace();
	}
%>