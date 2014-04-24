<cfscript>
	if ( ! structKeyExists(session, "user") ) {
		location(url="dsp_login.cfm",addtoken="false");		
	}	

	statusService = application.wirebox.getInstance('statusService');	

	saveResult = statusService.insert( session.user.id, form );
	if ( saveResult.status == 200 ){
		session.flash = {};
		session.flash.code = "true";
		session.flash.message = "Status Saved Successfully";
		location(url="index.cfm",addtoken="false");
	} 
	else {
		session.flash = {};
		session.flash.code = "false";
		session.flash.message = saveResult.message;
		location(url="index.cfm",addtoken="false"); 
	}

</cfscript>
