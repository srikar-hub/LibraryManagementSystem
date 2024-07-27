<%@page import="Utils.LibraryUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.Cookie" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Books</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
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
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        box-shadow: 0 2px 3px rgba(0, 0, 0, 0.1);
        background-color: #fff;
    }
    table, th, td {
        border: 1px solid #ddd;
    }
    th, td {
        padding: 12px;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
        color: #333;
    }
    tr:nth-child(even) {
        background-color: #f9f9f9;
    }
    tr:hover {
        background-color: #f1f1f1;
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
        String name = "";
        boolean f = false;
        Cookie[] c = request.getCookies();
        if (c == null) {
            response.sendRedirect("loginForm.jsp");
            return;
        } else {    
            for (Cookie cookie : c) {
                String tname = cookie.getName();
                if (tname.equals("email")) {
                    f = true;
                    name = cookie.getValue();
                }
            }
        }
        if (f) {
            out.print("Welcome " + name);                       
        } else {
            response.sendRedirect("loginForm.jsp");
        }
        %>
    </div>
</div>

<div class="container">
<% 
String email = null;
for (Cookie cookie : c) {
    if (cookie.getName().equals("email")) {
        email = cookie.getValue();
        break;
    }
}

if (email != null) {
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        con = LibraryUtil.getDatabaseDetails();
        ps = con.prepareStatement("SELECT bookname, borrowdate, returndate FROM borrowed_books WHERE email = ?");
        ps.setString(1, email);
        rs = ps.executeQuery();
%>
        <form action="ReturnBookServlet" method="post">
        <table>
            <tr>
                <th>Book Name</th>
                <th>Borrow Date</th>
                <th>Return Date</th>
                <th>Action</th>
            </tr>
            <% while (rs.next()) { %>
                <tr>
                    <td><%= rs.getString("bookname") %></td>
                    <td><%= rs.getString("borrowdate") %></td>
                    <td><%= rs.getString("returndate")==null ? "-":rs.getString("returndate") %></td>
                    <td>
                        <% if (rs.getString("returndate") == null) { %>
                            <button type="submit" name="bookname" value="<%= rs.getString("bookname") %>">Return</button>
                        <% } %>
                    </td>
                </tr>
            <% } %>
        </table>
        </form>
<% 
    } catch (Exception e) {
        e.printStackTrace();
    }
}
%>
</div>
</body>
</html>
