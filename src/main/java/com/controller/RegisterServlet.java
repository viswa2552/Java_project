package com.controller;

import java.io.IOException;
//import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		 
		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastName");
		String email = request.getParameter("email");
		String pass = request.getParameter("password");
		String temp = request.getParameter("contact");
		long contact = Long.parseLong(temp);
		
		RequestDispatcher dispatcher = null;
		Connection con  = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/finsol?useSSL = false", "root", "finsol");

			PreparedStatement pt = con.prepareStatement("INSERT INTO register_user(firstName,lastName,email, password, contact) VALUES(?,?,?,?,?)");
			
			pt.setString(1, fname);
			pt.setString(2, lname);
			pt.setString(3, email);
			pt.setString(4, pass);
			pt.setLong(5, contact);
			
			int rowCount = pt.executeUpdate();
			dispatcher = request.getRequestDispatcher("registration.jsp");
			if(rowCount>0) {
				request.setAttribute("status","success");
			}else {
				request.setAttribute("status","failed");
			}
			
			dispatcher.forward(request, response);
			
			
		} catch (Exception e) {
			
			
			e.printStackTrace();
		}finally {
		    try {
		        if (con != null) {
		            con.close();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		}

		
		
		
		
		
	}
	
	

}
