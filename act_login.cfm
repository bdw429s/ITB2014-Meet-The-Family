<cfscript>
	
userService = application.wirebox.getInstance('userService');
userid = userService.checkLogin( form.email, form.password );
if ( userid > 0 ) {
	session.user = {};
	session.user.id = userid;
	session.user.loggedIn = now(); 
	location(url="index.cfm",addtoken="false"); 
} 
else {
	session.flash = {};
	session.flash.code = 0;
	session.flash.message = "Login Failed, Please Try Again.";
	location(url="dsp_login.cfm",addtoken="false"); 
}



</cfscript>