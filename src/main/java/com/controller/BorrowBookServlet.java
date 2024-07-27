package com.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Utils.LibraryUtil;

/**
 * Servlet implementation class BorrowBookServlet
 */
public class BorrowBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BorrowBookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookname = request.getParameter("bookname");
		String borrowDateStr = request.getParameter("borrowdate");

        // Convert the date string to java.sql.Date
        Date borrowDate = null;
        try {
            java.util.Date utilDate = new SimpleDateFormat("yyyy-MM-dd").parse(borrowDateStr);
            borrowDate = new Date(utilDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();
        }
        
        String email = "";
        Cookie[] c = request.getCookies();
        if(c!=null) {
        	for(Cookie cookie:c) {
        		String tname = cookie.getName();
        		if(tname.equals("email")) {
        			email = cookie.getValue();
        			break;
        		}
        	}
        }
        if(email!=null) {
        	  Connection con = null;
              PreparedStatement ps = null;
              
        	try {
				con = LibraryUtil.getDatabaseDetails();
				ps=con.prepareStatement("insert into borrowed_books (email,bookname,borrowdate) values (?,?,?)");
				ps.setString(1,email);
				ps.setString(2, bookname);
				ps.setDate(3, borrowDate);
				ps.executeUpdate();
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        response.sendRedirect("borrowBook.jsp");
      
		
	}

}
