package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.LoginBean;
import com.model.LoginManager;

/**
 * Servlet implementation class LoginController
 */
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private LoginManager loginManager;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		loginManager = new LoginManager();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();

		String email = request.getParameter("email");

		String password = request.getParameter("password");

		LoginBean bean = new LoginBean();
		bean.setEmail(email);
		bean.setPassword(password);
		try {
			boolean res = loginManager.login(bean);
			if (res) {
				Cookie cookie= new Cookie("email",email);
				Cookie cookie2= new Cookie("password",password);
				response.addCookie(cookie);
				response.addCookie(cookie2);
				response.sendRedirect("home.jsp");
			} else {
				pw.print("<h3>Invalid Login Credentials</h3>");
			}
		} catch (ClassNotFoundException | SQLException e) {

			e.printStackTrace();
			pw.print("<h3>Something went wrong.</h3>");
		}

	}
}
