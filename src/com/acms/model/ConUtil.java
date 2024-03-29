package com.acms.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

@WebServlet("/ConUtil")
public class ConUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Resource(name = "jdbc/ams")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//Step 1: setting up the print writer 
		
			PrintWriter out = response.getWriter();
			response.setContentType("text/plain");
		
		//Step 2: Get a connection to a database
		
			Connection myConn = null;
			Statement myStmt = null;
			ResultSet myRs = null;
		
		try {
			myConn = ds.getConnection();
			
		//Step 3: Create SQL Statements 
			
			String sql="select * from tbl_student order by first_name";
			myStmt = myConn.createStatement();
						
		//Step 4: Execute SQL Statements 
			
			myRs = myStmt.executeQuery(sql);
			
		//Step 5: Process the result set
			while(myRs.next()) {
				String f_name = myRs.getString("first_name");
				String l_name = myRs.getString("last_name");

				out.println(f_name + " " + l_name);
			}
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
		}
		finally {
			close(myConn,myStmt,null);
		}
	}
	
	public void close(Connection myConn, Statement myStmt, ResultSet myRs) {

		try {
			if (myRs != null) {
				myRs.close();
			}

			if (myStmt != null) {
				myStmt.close();
			}

			if (myConn != null) {
				myConn.close();
			}
		} catch (Exception exc) {
			exc.printStackTrace();
		}
	}
}