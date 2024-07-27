package com.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.LoginBean;
import com.model.LoginManager;


/**
 * Servlet implementation class SignUpController
 */
public class SignUpController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginManager loginManager;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpController() {
        super();
        loginManager = new LoginManager();
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
         response.setContentType("text/html");
		
		PrintWriter pw = response.getWriter();
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
				
		
		try {
			LoginBean loginBean = new LoginBean();
			loginBean.setEmail(email);
			loginBean.setPassword(password);
			boolean res= loginManager.signup(loginBean);
			if(res) {
				response.sendRedirect("loginForm.jsp");
			}
			else {
				pw.print("<h3>Email already exists! Please use a different email </h3>");
				pw.print("<a href='SignupForm.jsp'>Go back to Signup</a>");
			}
		} catch (Exception e) {			
			e.printStackTrace();
            pw.println("<h3>An error occurred during signup. Please try again later.</h3>");
		}
		
	}

	}


