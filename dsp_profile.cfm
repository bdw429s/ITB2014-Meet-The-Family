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
<div class="profile_holder">
	<div class="profile_fullsize">
		<img src="img/profiles/#qUser.photo#" border="0" alt="#qUser.firstName# #qUser.lastName#'s Profile Photo">
	</div>
	<div class="profile_details">
		<h1>Profile: #qUser.firstName# #qUser.lastName#</h1>
		
		<div><b>Email:</b> #qUser.email#</div>
		
		<div>&nbsp;</div>
		<div><b>Registered:</b> #timeformat( qUser.createdat, "hh:mm tt")# on #dateformat( qUser.createdat, "mm/dd/yyyy")#</div>
	
	</div>
</div>
<h3>About</h3>
<div>#qUser.about#</div>

<h3>#qUser.firstName# #qUser.lastName#'s Status Posts</h3>

<cfif qStatuses.recordcount eq 0>
	<div class="alert alert-danger">#qUser.firstName# #qUser.lastName# is fighting the silence - 0 Status Updates</div>
<cfelse>	
	<cfloop query="qStatuses">
		<div class="status_holder <cfif qStatuses.currentrow mod 2>status_mod</cfif>" >
			<div class="status_message">
				#qStatuses.message#
			</div>	
			<div class="status_author">Shared at #timeformat( qStatuses.createdat, "hh:mm tt")# on #dateformat( qStatuses.createdat, "mm/dd/yyyy")#</div> 
		</div>
	</cfloop>	
</cfif>




<cfinclude template="layouts/inc_footer.cfm">
</cfoutput>