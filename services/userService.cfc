component displayname="User Service" hint="I look after the User Business Logic" output="false"
{
	
	property name="userDAO" inject="ID:userDAO" scope="instance";

	public function init(){
			return this;
	}
	
	public numeric function checkLogin(email, password) {
		
		if ( len(arguments.email) lte 5) {
			// email too short
			return 0;
		}
		else if ( len(arguments.password) eq 0 ) {
			// empty password
			return 0;
		}
		else {
			var userDAO = instance.userDAO;
			var user = userDAO.getUserByLogin( arguments.email, arguments.password );
			if ( user.recordcount eq 0) {
				// no user found with email and password
				return 0;
			}	
			else if ( user.deletedat neq "") {
				// user has been deleted
				return 0;
			}
			else {
				//login successful
				return user.id;
			}
		}
		
	}
		
	public struct function registerUser( formstruct ) {
		var result = {};
		var userDAO = instance.userDAO;
			
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
		var userDAO = instance.userDAO;
			
		user = userDAO.getUser( userid = arguments.userid, detail="full" );
		
		return user;
	}
	
	public query function getUsersWithStatus() {
		var userDAO = instance.userDAO;

		user = userDAO.getUsersWithStatus();
		
		return user;
	}
	
	
}