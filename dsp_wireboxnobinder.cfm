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

<h1>Wirebox No Binder</h1>

<h3>Setup in onApplicationStart</h3>
	<div class="status_holder">
		<div class="status_message">
			<pre style="font-size:1em; font-weight:bold; text-align:left;">
				wirebox = createObject("component", "wirebox.system.ioc.Injector").init();
				wirebox.getBinder().scanLocations( this.scanlocations );
				wirebox.getInstance('mtfAppSettings');
			</pre>
		</div>	
	</div>
	

<cfinclude template="layouts/inc_footer.cfm">
</cfoutput>