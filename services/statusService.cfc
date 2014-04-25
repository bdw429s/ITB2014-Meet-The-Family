component displayname="Status Service" hint="I look after the Statuses Business Logic" output="false"
{
	property name="statusDAO" inject="ID:statusDAO" scope="instance";

	public function init(){
		return this;
	}
	
	
	public query function getStatuses( numeric userid=-1){
		var statusDAO = instance.statusDAO;
		
		return statusDAO.getStatuses( userid = arguments.userid );
			
	}
	
	
	public struct function insert( userid, formstruct ) {
		var result = {};
		var statusDAO = instance.statusDAO;
		
		if ( userid == "" or userid == 0 ){
			result.status = 500;
			result.message = "You are not logged in, please login and try again";
		}
		else if ( len(trim(formstruct.message)) == 0 ) {
			result.status = 500;
			result.message = "Go back in time and enter a status message before posting it";
		} 
		else {
			
			statusDAO.insertStatus( arguments.userid , arguments.formstruct );
			result.status = 200;
			result.message = "Thanks for sharing - Geromino"; 
		}
		
		return result;
	}
	
}