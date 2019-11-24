package com.acms.controllers;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import com.acms.jdbc.Owner;
import com.acms.jdbc.Student;
import com.acms.jdbc.UserAccount;
import com.acms.jdbc.UserCookies;
import com.acms.model.OwnerDbUtil;
import com.acms.model.StudentDbUtil;
import com.acms.model.UserAccountDbUtil;

//newly added

@WebServlet("/userAccountControllerServlet")
public class userAccountControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Resource(name = "jdbc/ams")
	private DataSource ds;
	private UserAccountDbUtil userAccountDbUtil;
	private StudentDbUtil studentDbUtil;
	private OwnerDbUtil ownerDbUtil;
	private Cookie userIdCookie;
	private Cookie userTypeCookie;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();

		try {
			userAccountDbUtil = new UserAccountDbUtil(ds);
			studentDbUtil = new StudentDbUtil(ds);
			ownerDbUtil = new OwnerDbUtil(ds);
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");
			// if the command is missing, then default to login user
			if (theCommand == null) {
				theCommand = "LOGIN";
			}

			// route to the appropriate method
			switch (theCommand) {
			case "LOGIN":
				userLogin(request, response);
				break;
				
			case "REGISTER":
				registerUser(request, response);
				break;
				
			default:
				userLogin(request, response);
				break;
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// read the "command" parameter
			String theCommand = request.getParameter("command");
			if (theCommand != null) {				
				// route to the appropriate method
				switch (theCommand) {

				case "LIST":
					listUsers(request, response);
					break;
				case "DISABLE":
					disableOrEnableUser(request, response);
					break;
				case "LOGINPAGE":
					loginPage(request, response);
					break;
				case "SIGNUP":
					signUpPage(request, response);
					break;
				case "LOGOUT":
					signOut(request, response);
					break;
				case "CHANGE":
					changePW(request, response);
					break;
				case "CHANGEO":
					changeOPW(request, response);
					break;
				case "CHANGEA":
					changeAPW(request, response);
					break;
				case "CHANGE_PW":
					changePassword(request, response);
					break;
				case "CHANGE_OPW":
					changeOPassword(request, response);
					break;
				case "CHANGE_APW":
					changeAPassword(request, response);
					break;
				default:
					signOut(request, response); // if the command is missing, then default to listing users
					break;
				}
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	// method for login page controller route
	private void loginPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login-form.jsp");
		dispatcher.forward(request, response);
	}

	// method for change password page controller route
	private void changePW(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/change-student-password.jsp");
		dispatcher.forward(request, response);
	}

	// method for change password page controller route
	private void changeOPW(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/change-owners-password.jsp");
		dispatcher.forward(request, response);
	}

	// method for change password page controller route
	private void changeAPW(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/change-admin-password.jsp");
		dispatcher.forward(request, response);
	}

	// method for sign up page controller route
	private void signUpPage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/sign-up-form.jsp");
		dispatcher.forward(request, response);
	}

	// method for sign up page controller route
	private void signOut(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if (userIdCookie != null && userTypeCookie != null) {
			userIdCookie.setMaxAge(0);
			userTypeCookie.setMaxAge(0);
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/login-form.jsp");
		dispatcher.forward(request, response);
	}

	// method for user authentication controller
	private void userLogin(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			Student theStudent = null;
			Owner theOwner = null;
			List<UserAccount> theUsers = null;
			String username = request.getParameter("username");
			String password = request.getParameter("password");

			// Define Error Message Incase login Failed
			String Message = "Username or Password is Invalid";

			// creating new object of User Account Class
			UserAccount userAccount = new UserAccount();

			// Setting Username and password Recieved From Login JSP file to userAccount
			userAccount.setUsername(username);
			userAccount.setPassword(password);

			// creating object for UserAccountDbUtil.
			UserAccountDbUtil uaDbUtil = new UserAccountDbUtil(ds);

			// This class contains main logic of the login part.
			boolean validateAuth = uaDbUtil.Auth(userAccount);

			// If validateAuth boolean is true means username and password is correct
			if (validateAuth) {
				// getting user_id and user_type value of current logged in user
				int user_id = userAccountDbUtil.getUserId(username, password);
				int user_type = userAccountDbUtil.getUserType(user_id);

				// converting user_id and user_type to string
				String userId = Integer.toString(user_id);
				String userType = Integer.toString(user_type);

				userIdCookie = new Cookie("user_id", userId);
				userTypeCookie = new Cookie("user_type", userType);

				// setting cookie to expiry in 60 mins
				userIdCookie.setMaxAge(60 * 360);
				userTypeCookie.setMaxAge(60 * 360);

				// add the cookies on set response
				response.addCookie(userIdCookie);
				response.addCookie(userTypeCookie);

				if (user_id > 0 && user_type == 1) {
					boolean isExist = studentDbUtil.isStudentExist(user_id);
					if (!isExist) {
						int student_id = user_id;
						String firstName = "First Name";
						String lastName = "Last Name ";
						String address = "Address ";
						String email = "Email";
						String telephone = "Telephone";
						String dob = "Dob";
						String gender = "gender";
						String nationality = "nationality"; 
						String fathername = "fathername";
						String fathercontactno = "fathercontactno";
						String mothername = "mothername";
						String mothercontactno = "mothercontactno";
						String schoolattended = "schoolattended";
						String emergencyno = "emergencyno";
						String medium = "medium";
						String mediclecondition = "mediclecondition";
						
						// create a new student object
						Student student = new Student(student_id, firstName, lastName, address, email, telephone, dob, gender, nationality, fathername, fathercontactno, mothername, mothercontactno, schoolattended, emergencyno, medium, mediclecondition);
						
						// add the student to the database
						studentDbUtil.addStudent(student);
					}
					// get student from database (db util)
					theStudent = studentDbUtil.getStudent(user_id);
					// place student in the request attribute
					request.setAttribute("THE_STUDENT", theStudent);
					// send to jsp page: update-student-form.jsp
					RequestDispatcher dispatcher = request.getRequestDispatcher("/auth.jsp");
					dispatcher.forward(request, response);
				} else if (user_id > 0 && user_type == 2) {
					boolean isExist = ownerDbUtil.isOwnerExist(user_id);
					if (!isExist) {
						int owner_id = user_id;
						String firstName = "First Name";
						String lastName = "Last Name ";
						String address = "Address ";
						String email = "Email";
						String telephone = "Telephone";
						String nationality= "Nationality";
						// create a new student object
						Owner owner = new Owner(owner_id, firstName, lastName, address, email, telephone,nationality);
						// add the student to the database
						ownerDbUtil.addOwner(owner);
					}

					// get owner from database (db util)
					theOwner = ownerDbUtil.getOwner(user_id);
					// place owner in the request attribute
					request.setAttribute("THE_OWNER", theOwner);
					// send to jsp page: update-owner-form.jsp
					RequestDispatcher dispatcher = request.getRequestDispatcher("/auth.jsp");
					dispatcher.forward(request, response);
				} else {
					// then it is the admin account
					theUsers = userAccountDbUtil.getUserAccounts();
					// place owner in the request attribute
					request.setAttribute("USER_LIST", theUsers);
					RequestDispatcher req = request.getRequestDispatcher("auth.jsp");
					req.forward(request, response);
				}
			} else {
				// else username and password is incorrect return to the login page
				request.setAttribute("Message", Message);
				RequestDispatcher req = request.getRequestDispatcher("login-form.jsp");
				req.forward(request, response);
			}
		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	// controller to register new user account
	private void registerUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			int user_type = Integer.parseInt(request.getParameter("account-type"));

			// create a new user object
			UserAccount theUser = new UserAccount(username, password, user_type);

			// add the user to the database
			userAccountDbUtil.createUser(theUser);

			// get user id for given username and password
			int user_id = userAccountDbUtil.getUserId(username, password);

			request.setAttribute("errMessage", theUser.getUsername());
			request.setAttribute("user_id", user_id);

			// send back to the login page
			loginPage(request, response);

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	// controller to change students password account
	private void changePassword(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			int userId = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");

			// create a new user object
			UserAccount theUser = new UserAccount(userId, password);

			// update password for relevant user_id
			boolean result = userAccountDbUtil.updatePassword(theUser);

			String message = "Password Updated Successfully";
			String error = "Something went wrong, please try again";

			if (result)
				request.setAttribute("SUCCESS", message);
			else
				request.setAttribute("SUCCESS", error);

			// send back to the login page
			RequestDispatcher dispatcher = request.getRequestDispatcher("/change-student-password.jsp");
			dispatcher.forward(request, response);

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	// controller to change owners password account
	private void changeOPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			int userId = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");

			// create a new user object
			UserAccount theUser = new UserAccount(userId, password);

			// update password for relevant user_id
			boolean result = userAccountDbUtil.updatePassword(theUser);

			String message = "Password Updated Successfully";
			String error = "Something went wrong, please try again";

			if (result)
				request.setAttribute("SUCCESS", message);
			else
				request.setAttribute("SUCCESS", error);

			// send back to the login page
			RequestDispatcher dispatcher = request.getRequestDispatcher("/change-owners-password.jsp");
			dispatcher.forward(request, response);

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	// controller to change admin password account
	private void changeAPassword(HttpServletRequest request, HttpServletResponse response) throws Exception {

		try {
			int userId = Integer.parseInt(request.getParameter("user_id"));
			String password = request.getParameter("password");

			// create a new user object
			UserAccount theUser = new UserAccount(userId, password);

			// update password for relevant user_id
			boolean result = userAccountDbUtil.updatePassword(theUser);

			String message = "Password Updated Successfully";
			String error = "Something went wrong, please try again";

			if (result)
				request.setAttribute("SUCCESS", message);
			else
				request.setAttribute("SUCCESS", error);

			// send back to the login page
			RequestDispatcher dispatcher = request.getRequestDispatcher("/change-admin-password.jsp");
			dispatcher.forward(request, response);

		} catch (Exception ex) {
			throw new ServletException(ex);
		}
	}

	// controller to activate or deactivate the existing user
	private void disableOrEnableUser(HttpServletRequest request, HttpServletResponse response) throws Exception {

		// read user id from form data
		String theUserId = request.getParameter("user_id");

		// disable or enable user from database
		userAccountDbUtil.disableOrEnableUser(theUserId);

		// send them back to "list users" page
		listUsers(request, response);
	}

	/*
	 * private void updateUser(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception {
	 * 
	 * // read user info from form data int user_id =
	 * Integer.parseInt(request.getParameter("user_id")); String username =
	 * request.getParameter("username"); String password =
	 * request.getParameter("password"); int user_type =
	 * Integer.parseInt(request.getParameter("user_type")); boolean status =
	 * Boolean.getBoolean(request.getParameter("status"));
	 * 
	 * // create a new user object UserAccount theUser = new UserAccount(user_id,
	 * username, password, user_type, status);
	 * 
	 * // perform update on database userAccountDbUtil.updateUser(theUser);
	 * 
	 * // send them back to the "list users" page listUsers(request, response);
	 * 
	 * }
	 */
	/*
	 * private void loadUser(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception {
	 * 
	 * // read user id from form data String theUserId =
	 * request.getParameter("user_id");
	 * 
	 * // get user from database (db util) UserAccount theUser =
	 * userAccountDbUtil.getUser(theUserId);
	 * 
	 * // place user in the request attribute request.setAttribute("THE_USER",
	 * theUser);
	 * 
	 * // send to jsp page: update-user-form.jsp RequestDispatcher dispatcher =
	 * request.getRequestDispatcher("/update-user-form.jsp");
	 * 
	 * dispatcher.forward(request, response); }
	 */

	/*
	 * private void createUser(HttpServletRequest request, HttpServletResponse
	 * response) throws Exception { // read user info from form data String username
	 * = request.getParameter("username"); String password =
	 * request.getParameter("password"); int user_type =
	 * Integer.parseInt(request.getParameter("user_type"));
	 * 
	 * // create a new user object UserAccount theUser = new UserAccount(username,
	 * password, user_type);
	 * 
	 * // add the user to the database userAccountDbUtil.createUser(theUser);
	 * 
	 * // send back to main page (the users list) listUsers(request, response); }
	 */
	// List of Users
	private void listUsers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// get students list from dbUtil
		List<UserAccount> user = userAccountDbUtil.getUserAccounts();

		// add users to the request
		request.setAttribute("USER_LIST", user);

		// send to the view page (jsp)
		RequestDispatcher dispatcher = request.getRequestDispatcher("/list-users.jsp");
		dispatcher.forward(request, response);
	}
}
