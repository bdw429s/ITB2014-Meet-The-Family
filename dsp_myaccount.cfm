<cfoutput>
<!--- Controller / Logic --->
<cfscript>
	if ( ! structKeyExists(session, "user") ) {
		location(url="dsp_login.cfm",addtoken="false");		
	}	
	
	statusService = application.wirebox.getInstance('statusService');	
	qStatuses = statusService.getStatuses( userid = session.user.id );
	
</cfscript>	

<!--- View Code --->
<cfinclude template="layouts/inc_header.cfm">

<h1>My Account</h1>

<a href="dsp_profile.cfm?userid=#session.user.id#">View my Profile</a>

<h3>My Recent Posts</h3>
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