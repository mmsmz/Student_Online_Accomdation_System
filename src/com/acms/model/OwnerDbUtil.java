package com.acms.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import com.acms.jdbc.Owner;

public class OwnerDbUtil {

	@Resource(name="jdbc/ams")
	private DataSource ds;
	ConUtil c = new ConUtil();

	public OwnerDbUtil(DataSource dataSource) {
		ds = dataSource;
	}

	public List<Owner> getOwners() throws Exception {

		List<Owner> owners = new ArrayList<>();
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = ds.getConnection();

			// create sql statement
			String sql = "select * from `tbl_owner` where `isDeleted` = 1 order by `first_name` ";

			myStmt = myConn.createStatement();

			// execute query
			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id = myRs.getInt("owner_id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String address = myRs.getString("address");
				String email = myRs.getString("email");
				String telephone = myRs.getString("telephone");
				String nationality = myRs.getString("nationality");
				boolean isDeleted = myRs.getBoolean("isDeleted");
				// create new owner object
				Owner tempOwner = new Owner(id, firstName, lastName, address, email, telephone, nationality, isDeleted);

				// add it to the list of owners
				owners.add(tempOwner);
			}
			return owners;

		} finally {
			// close JDBC objects
			c.close(myConn, myStmt, myRs);
		}
	}

	public boolean addOwner(Owner theOwner) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = ds.getConnection();

			// create sql for insert
			String sql = "insert into tbl_owner " 
					+ "(owner_id,first_name, last_name, address, email, telephone, nationality)"
					+ "values (?, ?, ?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the owner
			myStmt.setInt(1, theOwner.getOwner_id());
			myStmt.setString(2, theOwner.getFirst_name());
			myStmt.setString(3, theOwner.getLast_name());
			myStmt.setString(4, theOwner.getAddress());
			myStmt.setString(5, theOwner.getEmail());
			myStmt.setString(6, theOwner.getTelephone());
			myStmt.setString(7, theOwner.getNationality());

			// execute sql insert
			int result = myStmt.executeUpdate();
			if(result ==0 )
				return false;
			else
				return true;
		} finally {
			// clean up JDBC objects
			c.close(myConn, myStmt, null);
		}
	}

	public void updateOwner(Owner theOwner) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = ds.getConnection();

			// create SQL update statement
			String sql = "update tbl_owner " + "set first_name=?, last_name=?, address=? ,email=? , telephone=?, nationality=? "
					+ "where owner_id=?";

			// prepare statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, theOwner.getFirst_name());
			myStmt.setString(2, theOwner.getLast_name());
			myStmt.setString(3, theOwner.getAddress());
			myStmt.setString(4, theOwner.getEmail());
			myStmt.setString(5, theOwner.getTelephone());
			myStmt.setString(6, theOwner.getNationality());
			myStmt.setInt(7, theOwner.getOwner_id());
			

			// execute SQL statement
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			c.close(myConn, myStmt, null);
		}
	}

	public Owner getOwner(int ownerId) throws Exception {

		Owner theOwner = null;
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get connection to database
			myConn = ds.getConnection();

			// create sql to get selected owner
			String sql = "select * from tbl_owner where owner_id=?";

			// create prepared statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, ownerId);

			// execute statement
			myRs = myStmt.executeQuery();

			// retrieve data from result set row
			if (myRs.next()) {
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String address = myRs.getString("address");
				String email = myRs.getString("email");
				String telephone = myRs.getString("telephone");
				String nationality = myRs.getString("nationality");
				
				boolean isDeleted = myRs.getBoolean("isDeleted");

				// use the ownerId during construction
				theOwner = new Owner(ownerId, firstName, lastName, address, email, telephone, nationality, isDeleted);
			} else {
				throw new Exception("Could not find owner id: " + ownerId);
			}

			return theOwner;
		} finally {
			// clean up JDBC objects
			c.close(myConn, myStmt, myRs);
		}
	}

	public boolean isOwnerExist(int ownerId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get connection to database
			myConn = ds.getConnection();
			// create sql to get selected student
			String sql = "select first_name from tbl_owner where owner_id=?";

			// create prepared statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, ownerId);

			// execute statement
			myRs = myStmt.executeQuery();

			// retrieve data from result set row	
			while (myRs.next()) {
				return true;
			} 
			return false;
		} finally {
			c.close(myConn, myStmt, myRs);
		}
	}
	
	public void deleteOwner(String theOwnerId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// convert owner id to int
			int ownerId = Integer.parseInt(theOwnerId);

			// get connection to database
			myConn = ds.getConnection();

			// create sql to delete Owner
			String sql = "update `tbl_owner` set `isDeleted` = 0 where `owner_id` = ?";

			// prepare statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, ownerId);

			// execute sql statement
			myStmt.execute();
		} finally {
			// clean up JDBC code
			c.close(myConn, myStmt, null);
		}
	}
}