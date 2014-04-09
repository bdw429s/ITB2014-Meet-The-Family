<cfscript>
	
	try {
		structdelete(session, "user");
		session.flash = {};
		session.flash.code = 0;
		session.flash.message = "You have been successfully logged out. ";
		location(url="dsp_login.cfm",addtoken="false"); 	
	}
	catch( any e ) {
		location(url="dsp_login.cfm",addtoken="false");
	}
</cfscript>