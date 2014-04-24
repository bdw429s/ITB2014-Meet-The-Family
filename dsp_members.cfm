<cfoutput>
<!--- Controller / Logic --->
<cfscript>
	if ( ! structKeyExists(session, "user") ) {
		location(url="dsp_login.cfm",addtoken="false");		
	}	
	
	userService = application.wirebox.getInstance('userService');	
	qMembers = userService.getUsersWithStatus();
</cfscript>	


<!--- View Code --->
<cfinclude template="layouts/inc_header.cfm">

<h2>Who's Who - Meet your Companions</h2>

<cfloop query="qMembers">
	<div class="status_holder <cfif qMembers.currentrow mod 2>status_mod</cfif>" >
		<div class="profile_thumb">
			<a href="dsp_profile.cfm?userid=#qMembers.userid#" title="#qMembers.firstName# #qMembers.lastName#"><img src="img/profiles/#qMembers.photo#" width="100" border="0" alt="#qMembers.firstName# #qMembers.lastName#'s Profile Photo"></a>
		</div>
		<div class="status_message_holder">
			<div class="status_message">
				<h3 class="member_name">#qMembers.firstName# #qMembers.lastName#</h3>
				<b>Last Status:</b><br>
				#qMembers.message#
			</div>	
			<div class="status_author">Shared by <a href="dsp_profile.cfm?userid=#qMembers.userid#">#qMembers.firstName# #qMembers.lastName#</a> at #timeformat( qMembers.createdat, "hh:mm tt")# on #dateformat( qMembers.createdat, "mm/dd/yyyy")#</div>
		</div> 
	</div>
</cfloop>	





<cfinclude template="layouts/inc_footer.cfm">
</cfoutput>