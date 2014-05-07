component displayname="Status Service" hint="I look after the Statuses Business Logic" output="false"
{
	property name="statusDAO" inject="statusDAO";

	public function init(){
		variables.cache = application.cachebox.getCache( 'default' );
		return this;
	}
	
	
	public query function getStatuses( numeric userid=-1){
		
		// Get from cache, create and store if neccessary
		return cache.getOrSet(
					// ID for cache storage
			    	'statuses_#userID#',
			    	// closure to produce data if neccessary
					function() {
						return statusDAO.getStatuses( userid = userid );					
					},
					// Time in minutes to store in cache
					20
				);
	}
	
	
	public struct function insert( userid, formstruct ) {
		var result = {};
		
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
			
			// Clear cache for this user
			cache.clear( 'statuses_#userID#' );
			// Clear cache for "full" list of statues
			cache.clear( 'statuses_-1' );
			
		}
		
		return result;
	}
	
}