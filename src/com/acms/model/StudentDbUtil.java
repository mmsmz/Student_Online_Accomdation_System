package com.acms.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.sql.DataSource;

import com.acms.jdbc.Student;

public class StudentDbUtil {

	@Resource(name = "jdbc/ams")
	private DataSource ds;

	ConUtil c = new ConUtil();

	public StudentDbUtil(DataSource dataSource) {
		ds = dataSource;
	}

	public List<Student> getStudents() throws Exception {

		List<Student> students = new ArrayList<>();
		Connection myConn = null;
		Statement myStmt = null;
		ResultSet myRs = null;

		try {
			// get a connection
			myConn = ds.getConnection();

			// create sql statement
			String sql = "select * from `tbl_student` where `isDeleted` = 1 order by `first_name` ";

			myStmt = myConn.createStatement();

			// execute query
			myRs = myStmt.executeQuery(sql);

			// process result set
			while (myRs.next()) {
				// retrieve data from result set row
				int id = myRs.getInt("student_id");
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String address = myRs.getString("address");
				String email = myRs.getString("email");
				String telephone = myRs.getString("telephone");
				String dob = myRs.getString("dob");
				String gender = myRs.getString("gender");
				String nationality = myRs.getString("nationality");
				String fathername = myRs.getString("fathername");
				String fathercontactno = myRs.getString("fathercontactno");
				String mothername = myRs.getString("mothername");
				String mothercontactno = myRs.getString("mothercontactno");
				String schoolattended = myRs.getString("schoolattended");
				String emergencyno = myRs.getString("emergencyno");
				String medium = myRs.getString("medium");
				String mediclecondition = myRs.getString("mediclecondition");

				boolean isDeleted = myRs.getBoolean("isDeleted");
				// create new student object
				Student tempStudent = new Student(id, firstName, lastName, address, email, telephone, dob, gender,
						nationality, fathername, fathercontactno, mothername, mothercontactno, schoolattended,
						emergencyno, medium, mediclecondition, isDeleted);

				// add it to the list of students
				students.add(tempStudent);
			}

			return students;
		} finally {
			// close JDBC objects
			c.close(myConn, myStmt, myRs);
		}
	}

	public boolean addStudent(Student theStudent) throws Exception {
		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = ds.getConnection();

			// create sql for insert
			String sql = "insert into tbl_student "
					+ "(student_id, first_name, last_name, address, email, telephone,dob, gender, nationality, fathername, fathercontactno, mothername, mothercontactno, schoolattended, emergencyno, medium, mediclecondition )"
					+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

			myStmt = myConn.prepareStatement(sql);

			// set the param values for the student
			myStmt.setInt(1, theStudent.getStudent_id());
			myStmt.setString(2, theStudent.getFirst_name());
			myStmt.setString(3, theStudent.getLast_name());
			myStmt.setString(4, theStudent.getAddress());
			myStmt.setString(5, theStudent.getEmail());
			myStmt.setString(6, theStudent.getTelephone());
			myStmt.setString(7, theStudent.getDob());
			myStmt.setString(8, theStudent.getGender());
			myStmt.setString(9, theStudent.getNationality());
			myStmt.setString(10, theStudent.getFathername());
			myStmt.setString(11, theStudent.getFathercontactno());
			myStmt.setString(12, theStudent.getMothername());
			myStmt.setString(13, theStudent.getMothercontactno());
			myStmt.setString(14, theStudent.getSchoolattended());
			myStmt.setString(15, theStudent.getEmergencyno());
			myStmt.setString(16, theStudent.getMedium());
			myStmt.setString(17, theStudent.getMediclecondition());

			// execute sql insert
			int result = myStmt.executeUpdate();

			if (result > 0)
				return true;
			else
				return false;

		} finally {
			// clean up JDBC objects
			c.close(myConn, myStmt, null);
		}
	}

	public void updateStudent(Student theStudent) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// get db connection
			myConn = ds.getConnection();

			// create SQL update statement
			String sql = "update tbl_student " + "set first_name=?, last_name=?, address=? ,email=? , telephone=?, dob=?, gender=?, nationality=?, fathername=?, fathercontactno=?, mothername=?, mothercontactno=?, schoolattended=?, emergencyno=?, medium=?, mediclecondition=? "
					+ "where student_id=?";

			// prepare statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setString(1, theStudent.getFirst_name());
			myStmt.setString(2, theStudent.getLast_name());
			myStmt.setString(3, theStudent.getAddress());
			myStmt.setString(4, theStudent.getEmail());
			myStmt.setString(5, theStudent.getTelephone());
			myStmt.setInt(6, theStudent.getStudent_id());

			myStmt.setString(7, theStudent.getDob());
			myStmt.setString(8, theStudent.getGender());
			myStmt.setString(9, theStudent.getNationality());
			myStmt.setString(10, theStudent.getFathername());
			myStmt.setString(11, theStudent.getFathercontactno());
			myStmt.setString(12, theStudent.getMothername());
			myStmt.setString(13, theStudent.getMothercontactno());
			myStmt.setString(14, theStudent.getSchoolattended());
			myStmt.setString(15, theStudent.getEmergencyno());
			myStmt.setString(16, theStudent.getMedium());
			myStmt.setString(17, theStudent.getMediclecondition());
			// execute SQL statement
			myStmt.execute();
		} finally {
			// clean up JDBC objects
			c.close(myConn, myStmt, null);
		}
	}

	public boolean isStudentExist(int studentId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet result = null;

		try {
			// get connection to database
			myConn = ds.getConnection();
			// create sql to get selected student
			String sql = "select count(*) from tbl_student where student_id=?";

			// create prepared statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, studentId);

			// execute statement
			result = myStmt.executeQuery();

			// retrieve data from result set row
			if (result != null)
				return true;
			else
				return false;

		} finally {
			c.close(myConn, myStmt, result);
		}
	}

	public Student getStudent(int studentId) throws Exception {

		Student theStudent = null;
		Connection myConn = null;
		PreparedStatement myStmt = null;
		ResultSet myRs = null;

		try {
			// get connection to database
			myConn = ds.getConnection();

			// create sql to get selected student
			String sql = "select * from tbl_student where student_id=?";

			// create prepared statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, studentId);

			// execute statement
			myRs = myStmt.executeQuery();

			// retrieve data from result set row
			if (myRs.next()) {
				String firstName = myRs.getString("first_name");
				String lastName = myRs.getString("last_name");
				String address = myRs.getString("address");
				String email = myRs.getString("email");
				String telephone = myRs.getString("telephone");
				String dob = myRs.getString("dob");
				String gender = myRs.getString("gender");
				String nationality = myRs.getString("nationality");
				String fathername = myRs.getString("fathername");
				String fathercontactno = myRs.getString("fathercontactno");
				String mothername = myRs.getString("mothername");
				String mothercontactno = myRs.getString("mothercontactno");
				String schoolattended = myRs.getString("schoolattended");
				String emergencyno = myRs.getString("emergencyno");
				String medium = myRs.getString("medium");
				String mediclecondition = myRs.getString("mediclecondition");
				boolean isDeleted = myRs.getBoolean("isDeleted");

				// use the studentId during construction
				theStudent = new Student(studentId, firstName, lastName, address, email, telephone, dob, gender, nationality, fathername, fathercontactno, mothername, mothercontactno, schoolattended, emergencyno, medium, mediclecondition, isDeleted);
			} else {
				throw new Exception("Could not find student id: " + studentId);
			}

			return theStudent;
		} finally {
			// clean up JDBC objects
			c.close(myConn, myStmt, myRs);
		}
	}

	public void deleteStudent(String theStudentId) throws Exception {

		Connection myConn = null;
		PreparedStatement myStmt = null;

		try {
			// convert student id to int
			int studentId = Integer.parseInt(theStudentId);

			// get connection to database
			myConn = ds.getConnection();

			// create sql to delete student
			String sql = "update `tbl_student` set `isDeleted` = 0 where `student_id` = ?";

			// prepare statement
			myStmt = myConn.prepareStatement(sql);

			// set params
			myStmt.setInt(1, studentId);

			// execute sql statement
			myStmt.execute();
		} finally {
			// clean up JDBC code
			c.close(myConn, myStmt, null);
		}
	}
}