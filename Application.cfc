component output="false"
{
	
	this.name = "Website_" & cgi.server_name;
 	this.applicationTimeout = createTimeSpan(0,1,0,0);
    this.clientmanagement= "yes";
    this.loginstorage = "session" ;
    this.sessionmanagement = "yes";
    this.sessiontimeout = createTimeSpan(0,0,20,0);
    this.setClientCookies = "yes";
    this.setDomainCookies = "no";
    this.datasource = "whoswho";
    this.scanlocations = ['/services'];
    

       
	/**
	 * @hint The application first starts: the first request for a page is processed or the first CFC method is invoked by an event gateway instance, or a web services or Flash Remoting CFC.
	 */
	public boolean function onApplicationStart(){
		
		wirebox = new wirebox.system.ioc.Injector();
		wirebox.getBinder().scanLocations( this.scanlocations );
		//call without scanning or mapping
		wirebox.getInstance( 'config.mtfAppSettings' );
		//wirebox = createObject("component", "wirebox.system.ioc.Injector").init(binder="config.wirebox");

		// Create CacheBox. It will automatically register itself in the application scope.
		new cachebox.system.cache.CacheFactory();

		return true;
	}

	/**
	 * @hint The application ends: the application times out, or the server is stopped
	 */
	public void function onApplicationEnd(ApplicationScope){

	}

	/**
	 * @hint A request starts
	 */
	public boolean function onRequestStart(String targetPage){
		if( ( !structKeyExists(application,'wirebox') || !structKeyExists(application,'appsettings') ) ) {
			onApplicationStart();
		}
		return true;
	}

	/**
	 * @hint All pages in the request have been processed:
	 */
	public void function onRequestEnd(String targetPage){

	}

	/**
	 * @hint A session starts
	 */
	public void function onSessionStart(){

	}

	/**
	 * @hint A session ends
	 */
	public void function onSessionEnd(SessionScope,ApplicationScope){

	}

	/**
	 * @hint ColdFusion received a request for a non-existent page.
	 */
	/*public boolean function onMissingTemplate(String targetPage) {

		return true;
	}*/

	/**
	 * @hint An exception that is not caught by a try/catch block occurs.
	 */
	/*public void function onError(Exception,EventName) {

	}*/

	/**
	 * @hint Handles missing method exceptions
	 */
	public void function onMissingMethod(String method,Struct args) {

	}

	/**
	 * @hint HTTP or AMF calls are made to an application.
	 */
	/*public void function onCFCRequest(String cfcname,String method,Struct args){

	}*/

	
}