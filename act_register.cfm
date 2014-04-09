<cfscript>
	
userService = new services.userService();
saveResult = userService.registerUser( form );
if ( saveResult.status == 200 ) {
	session.user = {};
	session.user.id = saveResult.id;
	session.user.loggedIn = now(); 
	session.flash = {};
	session.flash.code = 1;
	session.flash.message = saveResult.message;
	location(url="index.cfm",addtoken="false"); 
} 
else {
	session.flash = {};
	session.flash.code = 0;
	session.flash.message = saveResult.message;
	session.formstruct = form;
	location(url="dsp_login.cfm",addtoken="false"); 
}



</cfscript>