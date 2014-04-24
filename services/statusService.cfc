component displayname="Status Service" hint="I look after the Statuses Business Logic" output="false"
{

	property name="statusDAO" inject="ID:statusDAO" scope="instance";
	
	public function init(){
			return this;
	}
	
	
	public query function getStatuses( numeric userid ){

		var local.Status = instance.statusDAO;

		return local.Status.getStatuses( userid = arguments.userid );
			
	}
	
	
	public struct function insert( userid, formstruct ) {
		var local.result = {};
			local.statusDAO = instance.statusDAO;
		
		if ( userid == "" or userid == 0 ){
			local.result.status = 500;
			local.result.message = "You are not logged in, please login and try again";
		}
		else if ( len(trim(formstruct.message)) == 0 ) {
			local.result.status = 500;
			local.result.message = "Go back in time and enter a status message before posting it";
		} 
		else {
			
			local.statusDAO.insertStatus( arguments.userid , arguments.formstruct );
			local.result.status = 200;
			local.result.message = "Thanks for sharing - Geromino"; 
		}
		
		return local.result;
	}
	
}