<cfoutput>
<!--- Controller / Logic --->
<cfscript>
	if ( ! structKeyExists(session, "user") ) {
		location(url="dsp_login.cfm",addtoken="false");		
	}	
	
	
	statusService = new services.statusService();
	qStatuses = statusService.getStatuses();
</cfscript>	


<!--- View Code --->
<cfinclude template="layouts/inc_header.cfm">





<h2>For some people, small, beautiful events are what life is all about!</h2>
<h3>Share yours</h3>

<form method="post" action="act_status_insert.cfm">
	<textarea name="message" class="status"></textarea>
	
	<input type="submit" name="btn_share" value="Share" class="btn btn-primary">
</form>

<h2>Whats going on in Time and Space</h2>
<cfloop query="qStatuses">
	<div class="status_holder <cfif qStatuses.currentrow mod 2>status_mod</cfif>" >
		<div class="profile_thumb">
			<a href="dsp_profile.cfm?userid=#qStatuses.userid#" title="#qStatuses.firstName# #qStatuses.lastName#"><img src="img/profiles/#qStatuses.photo#" width="100" border="0" alt="#qStatuses.firstName# #qStatuses.lastName#'s Profile Photo">
		</div>
		<div class="status_message_holder">
			<div class="status_message">
				#qStatuses.message#
			</div>	
			<div class="status_author">Shared by <a href="dsp_profile.cfm?userid=#qStatuses.userid#">#qStatuses.firstName# #qStatuses.lastName#</a> at #timeformat( qStatuses.createdat, "hh:mm tt")# on #dateformat( qStatuses.createdat, "mm/dd/yyyy")#</div>
		</div> 
	</div>
</cfloop>	





<cfinclude template="layouts/inc_footer.cfm">
</cfoutput>