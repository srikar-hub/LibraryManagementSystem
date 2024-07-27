<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>About Us</title>
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
    .container {
        padding: 20px;
    }
    .about-content {
        max-width: 800px;
        margin: auto;
        padding: 20px;
        background-color: #f4f4f4;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    .about-content h2 {
        text-align: center;
    }
    .about-content p {
        text-align: justify;
        line-height: 1.6;
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

<div class="container">
    <div class="about-content">
        <h2>About Our Library Management System</h2>
        <p>
            Welcome to our Library Management System, a comprehensive solution designed to simplify and enhance the management of library resources. Our system provides a user-friendly interface that allows users to effortlessly borrow, return, and keep track of books. With 24/7 access, you can explore our vast catalog and manage your account from anywhere at any time.
        </p>
        <p>
            Our mission is to make library management more efficient and accessible. We understand the importance of having an organized system for managing books and resources, which is why we have incorporated features that cater to both librarians and users. From easy management tools to real-time updates, our system is built to support the dynamic needs of modern libraries.
        </p>
        <p>
            Whether you are a student, educator, or avid reader, our Library Management System is here to support your literary journey. Thank you for choosing our platform, and we hope you enjoy a seamless and enriching experience.
        </p>
    </div>
</div>

<footer>
    <div class="container">
        <p>&copy; 2024 Library Management System. All rights reserved.</p>
    </div>
</footer>
</body>
</html>
