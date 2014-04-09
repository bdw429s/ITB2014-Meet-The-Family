<cfcomponent name="userDAO" displayname="User DAO" hint="I look after the User Data Access" output="false">

	<cffunction name="init" returntype="any">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getUser" returntype="query">
		<cfargument name="userid" required="false" type="numeric" default="">
		<cfargument name="email" required="false" type="string" default="">
		<cfargument name="detail" required="false" type="string" default="normal">
		
		<cfset var q = "">
		
		<cfquery name="q">
			select 
			id 
			,urlid
			,firstName
			,lastName
			,email 
			<cfif arguments.detail eq "full" or arguments.detail eq "normal">
			,birthdate 
			,gender
			</cfif>
			<cfif arguments.detail eq "full">
			,about
			</cfif>
			,createdat
			,deletedat
			
			from users
			where 1=1
			<cfif arguments.userid gt "">
				and id = <cfqueryparam value="#arguments.userid#" cfsqltype="cf_sql_integer" >
			</cfif>
			<cfif arguments.email gt "">
				and email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
			</cfif>
			limit 1
		</cfquery>	
		
		<cfreturn q>
		
	</cffunction>
	
	
	<cffunction name="getUserByLogin" returntype="query">
		<cfargument name="email" required="true" type="string">
		<cfargument name="password" required="true" type="string">
		
		<cfset var q = "">
		
		<cfquery name="q">
			select id, email, deletedat
			from users
			where email = <cfqueryparam value="#arguments.email#" cfsqltype="cf_sql_varchar">
			and password = <cfqueryparam value="#arguments.password#" cfsqltype="cf_sql_varchar">
		</cfquery>	
		
		<cfreturn q>
		
	</cffunction>
	
	<cffunction name="insertUser" returntype="numeric">
		<cfargument name="formstruct" required="true" type="struct">
			
		<cfset var q = "">
		
		<cfquery result="q">
			insert into users
			set
			email = <cfqueryparam value="#arguments.formstruct.email#" cfsqltype="cf_sql_varchar" >,
			password = <cfqueryparam value="#arguments.formstruct.password#" cfsqltype="cf_sql_varchar" >,
			firstName = <cfqueryparam value="#arguments.formstruct.firstName#" cfsqltype="cf_sql_varchar" >,
			lastName = <cfqueryparam value="#arguments.formstruct.lastName#" cfsqltype="cf_sql_varchar" >,
			createdat = #now()#
		</cfquery>	
		
		<cfreturn q.generatedkey>
		
	</cffunction>	
	
</cfcomponent>