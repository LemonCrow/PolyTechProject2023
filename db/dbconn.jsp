<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>

<%
	Connection conn = null;
	
	String url = "jdbc:mariadb://poly0411.cafe24.com/poly0411";
	String user = "poly0411";
	String password = "poly0411@@";
	
	Class.forName("org.mariadb.jdbc.Driver");
	
	conn = DriverManager.getConnection(url, user, password);
	out.println("접속성공")!
	
%>
