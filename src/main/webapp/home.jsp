<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
    }
    .navbar {
        overflow: hidden;
        background-color: #333;
    }
    .navbar a {
        float: left;
        display: block;
        color: #f2f2f2;
        text-align: center;
        padding: 14px 16px;
        text-decoration: none;
    }
    .navbar a:hover {s
        background-color: #ddd;
        color: black;
    }
    .navbar .user-email {
        float: right;
        color: #f2f2f2;
        padding: 14px 16px;
    }
    .container {
        padding: 20px;
    }
</style>
</head>
<body>
<div class="navbar">
    <a href="home.jsp">Home</a>
    <a href="borrowBook.jsp">Borrow Book</a>
    <a href="mybooks.jsp">My Books</a>
    <a href="about.jsp">About</a>
    <a href="logout.jsp">Logout</a>
    <div class="user-email">
        <% 
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        String name="";
        boolean f = false;
        Cookie[] c = request.getCookies();
        if(c==null){
            response.sendRedirect("loginForm.jsp");
            return;
        } else {    
            for(Cookie cookie : c){
                String tname = cookie.getName();
                if(tname.equals("email")){
                    f=true;
                    name = cookie.getValue();
                }
            }
        }
        if(f){
            out.print("Welcome " + name);                       
        } else {
            response.sendRedirect("loginForm.jsp");
        }
        %>
    </div>
</div>
<div class="container">
   
</div>
</body>
</html>
