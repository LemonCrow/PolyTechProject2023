<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>test</title>
</head>
<body>
<script>
    <% 
        session.invalidate(); 
        String message = "삭제 완료"; 
    %>
    alert("<%= message %>");
    location.href="index.jsp";
</script>

</body>
</html>