package com.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Utils.LibraryUtil;
import java.sql.*;

/**
 * Servlet implementation class ReturnBookServlet
 */
public class ReturnBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnBookServlet() {
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
		// TODO Auto-generated method stub
		

	
		        String bookname = request.getParameter("bookname");
		        String email = null;
		        Cookie[] cookies = request.getCookies();
		        if (cookies != null) {
		            for (Cookie cookie : cookies) {
		                if (cookie.getName().equals("email")) {
		                    email = cookie.getValue();
		                    break;
		                }
		            }
		        }
		        
		        if (email == null || bookname == null) {
		            response.sendRedirect("loginForm.jsp");
		            return;
		        }

		        Connection con = null;
		        PreparedStatement ps = null;
		        try {
		            con = LibraryUtil.getDatabaseDetails();
		            String query = "UPDATE borrowed_books SET returndate = CURRENT_DATE WHERE email = ? AND bookname = ?";
		            ps = con.prepareStatement(query);
		            ps.setString(1, email);
		            ps.setString(2, bookname);
		            ps.executeUpdate();
		        } catch(Exception e) {
		            e.printStackTrace();
		        } 
		        
		        response.sendRedirect("mybooks.jsp");
		    }
		}

	