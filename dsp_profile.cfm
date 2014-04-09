<cfoutput>
<!--- Controller / Logic --->
<cfscript>
	if ( ! structKeyExists(session, "user") ) {
		location(url="dsp_login.cfm",addtoken="false");		
	}	
	
	userService = new services.userService(); 
	qUser = userService.getUser(url.userid);
	
	statusService = new services.statusService();
	qStatuses = statusService.getStatuses( userid=url.userid );
	
</cfscript>	

<!--- View Code --->
<cfinclude template="layouts/inc_header.cfm">

<h1>Profile: #qUser.firstName# #qUser.lastName#</h1>

<div>Email: #qUser.email#</div>

<div>&nbsp;</div>

<div>About</div>
<div>#qUser.about#</div>

<div>&nbsp;</div>
<div>Registered #timeformat( qUser.createdat, "hh:mm tt")# on #dateformat( qUser.createdat, "mm/dd/yyyy")#</div>

<h3>#qUser.firstName# #qUser.lastName#'s Status Posts</h3>

<cfloop query="qStatuses">
	<div class="status_holder <cfif qStatuses.currentrow mod 2>status_mod</cfif>" >
		<div class="status_message">
			#qStatuses.message#
		</div>	
		<div class="status_author">Shared at #timeformat( qStatuses.createdat, "hh:mm tt")# on #dateformat( qStatuses.createdat, "mm/dd/yyyy")#</div> 
	</div>
</cfloop>	





<cfinclude template="layouts/inc_footer.cfm">
</cfoutput>