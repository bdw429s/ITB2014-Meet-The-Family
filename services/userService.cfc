component displayname="User Service" hint="I look after the User Business Logic" output="false"
{

	property name="uDAO" inject="ID:userDAO";
	property name="log" inject="logbox:logger:{this}";

	public function init(){
			return this;
	}

	public numeric function checkLogin(email, password) {

		if ( len(arguments.email) lte 5) {
			// email too short
			log.warn("#arguments.email# (#cgi.remote_addr#) entered an email that was too short");
			return 0;
		}
		else if ( len(arguments.password) eq 0 ) {
			// empty password
			log.warn("#arguments.email# (#cgi.remote_addr#) entered an empty password");
			return 0;
		}
		else {
			var userDAO = uDAO;
			var user = userDAO.getUserByLogin( arguments.email, arguments.password );
			if ( user.recordcount eq 0) {
				log.warn("#arguments.email# (#cgi.remote_addr#) entered invalid credentials");
				// no user found with email and password
				return 0;
			}
			else if ( user.deletedat neq "") {
				log.warn("#arguments.email# (#cgi.remote_addr#) logged in with a deleted user");
				// user has been deleted
				return 0;
			}
			else {
				log.info("#arguments.email# (#cgi.remote_addr#) logged in successfully");
				//login successful
				return user.id;
			}
		}

	}

	public struct function registerUser( formstruct ) {
		var result = {};
		var userDAO = uDAO;

		user = userDAO.getUser( email=arguments.formstruct.email, detail="short" );
		if ( user.recordcount == 1) {
			result.status = 500;
			result.message = "Email address is already taken, please try again.";
		}
		else {

			try {
				userid = userDAO.insertUser( arguments.formstruct );
				result.status = 200;
				result.message = "Thank you for signing up. Welcome to Who's Who";
				result.id = userid;
			}
			catch( any e) {
				rethrow;
				result.status = 500;
				result.message = "Database Error Inserting User";
			}

		}


		return result;

	}

	public query function getUser( numeric userid ) {
		var userDAO = uDAO;

		user = userDAO.getUser( userid = arguments.userid, detail="full" );

		return user;
	}

	public query function getUsersWithStatus() {
		var userDAO = uDAO;

		user = userDAO.getUsersWithStatus();

		return user;
	}


}