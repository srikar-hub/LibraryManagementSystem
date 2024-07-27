<%@page import="Utils.LibraryUtil"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
     <%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Borrow Book</title>
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
    .navbar a:hover {
        background-color: #ddd;
        color: black;
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
</div>
</head>
<body>


<% 
String userEmail = null;
Cookie[] cookies = request.getCookies();
if (cookies != null) {
    for (Cookie cookie : cookies) {
          String tname=cookie.getName();
          if(tname.endsWith("email")){
        	userEmail = cookie.getValue();
        	break;
        }
    }
}


if (userEmail == null) {
    response.sendRedirect("loginForm.jsp");
    return;
}
Connection con =null;
con = LibraryUtil.getDatabaseDetails(); 

 Statement bookstatement = con.createStatement(); 
 ResultSet rs = bookstatement.executeQuery("select * from books");
 
 PreparedStatement  borrowedBooksStatement = con.prepareStatement("select bookname from borrowed_books where email=? AND returndate is NULL");
 borrowedBooksStatement.setString(1,userEmail);
 ResultSet borrowedBooksResultSet =  borrowedBooksStatement.executeQuery();
 Set<String> borrowedBooks = new HashSet<>();
 while(borrowedBooksResultSet.next()){
	 borrowedBooks.add(borrowedBooksResultSet.getString("bookname"));
 }
 
 %>
<form action="BorrowBookServlet" method="post">
    <span>Select book to Borrow :</span>
        <select name="bookname">
       <% while(rs.next()){

	String bname =  rs.getString("bookname");
	if(!borrowedBooks.contains(bname)){
 %> 
	    
         <option value="<%= bname %>"><%= bname %></option>
        <% } } %>
        </select>
        <input type="date" name="borrowdate" required/>
        <input type="submit" value="Submit">
</form>
</body>
</html>