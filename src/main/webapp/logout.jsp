<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

Cookie[] c =request.getCookies();
for(Cookie cookie:c){
	cookie.setMaxAge(0);
	response.addCookie(cookie);
}
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
response.sendRedirect("loginForm.jsp");
%>
</body>
</html>