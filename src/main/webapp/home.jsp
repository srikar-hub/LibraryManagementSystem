<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        color: #333;
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
    .navbar a:hover {
        background-color: #ddd;
        color: black;
    }
    .navbar .user-email {
        float: right;
        color: #f2f2f2;
        padding: 14px 16px;
    }
    .hero {
        background: url('library.jpg') no-repeat center center/cover;
        height: 400px;
        display: flex;
        justify-content: center;
        align-items: center;
        color: white;
        text-align: center;
    }
    .hero-content h2 {
        font-size: 48px;
        margin: 0;
    }
    .hero-content p {
        font-size: 24px;
        margin: 20px 0;
    }
    .btn {
        background-color: #4CAF50;
        color: white;
        padding: 10px 20px;
        text-decoration: none;
        font-size: 18px;
        border-radius: 5px;
    }
    .features {
        padding: 50px 20px;
        background-color: #f4f4f4;
    }
    .features .container {
        display: flex;
        justify-content: space-around;
    }
    .feature {
        text-align: center;
        padding: 20px;
    }
    .feature h3 {
        font-size: 24px;
        margin-bottom: 10px;
    }
    footer {
        background-color: #333;
        color: white;
        text-align: center;
        padding: 20px 0;
    }
    footer p {
        margin: 0;
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
        if(c == null){
            response.sendRedirect("loginForm.jsp");
            return;
        } else {    
            for(Cookie cookie : c){
                String tname = cookie.getName();
                if(tname.equals("email")){
                    f = true;
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

<div class="hero">
    <div class="hero-content">
        <h2>Welcome to Our Library</h2>
        <p>Manage your books and resources efficiently.</p>
        <a href="borrowBook.jsp" class="btn">Get Started</a>
    </div>
</div>

<div class="features">
    <div class="container">
        <div class="feature">
            <h3>Easy Management</h3>
            <p>Keep track of books and resources with ease.</p>
        </div>
        <div class="feature">
            <h3>User-Friendly Interface</h3>
            <p>Navigate through our system effortlessly.</p>
        </div>
        <div class="feature">
            <h3>24/7 Access</h3>
            <p>Access the library from anywhere, anytime.</p>
        </div>
    </div>
</div>

<footer>
    <div class="container">
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
