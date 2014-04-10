<cfcomponent name="statusDAO" displayname="User DAO" hint="I look after the Status Data Access" output="false">

	<cffunction name="init" returntype="any">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getStatuses" returntype="query">
		<cfargument name="userid" required="false" type="numeric" default="-1">
		
		<cfset var q = "">
		
		<cfquery name="q">
			select 
			statuses.id as statusid
			,statuses.userid
			,statuses.message
			,statuses.createdat
			,users.urlid
			,users.firstName
			,users.lastName
			,users.photo
			from statuses
			inner join users on statuses.userid = users.id
			where statuses.deletedat is null
			and users.deletedat is null
			<cfif arguments.userid gte 0>
				and userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_varchar" >
			</cfif>	
			order by statuses.createdat desc
		</cfquery>	
		
		<cfreturn q>
		
	</cffunction>
	
	<cffunction name="insertStatus" returntype="numeric">
		<cfargument name="userid" required="true" type="numeric">
		<cfargument name="formstruct" required="true" type="struct">
			
		<cfset var q = "">
		
		<cfquery result="q">
			insert into statuses
			set
			userid = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer" >,
			message = <cfqueryparam value="#arguments.formstruct.message#" cfsqltype="cf_sql_varchar" >,
			createdat = #now()#
		</cfquery>	
		
		<cfreturn q.generatedkey>
		
	</cffunction>	
	
</cfcomponent>