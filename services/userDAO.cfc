<cfcomponent name="userDAO" displayname="User DAO" hint="I look after the User Data Access" output="false">

	<cffunction name="init" returntype="any">
		<cfreturn this>
	</cffunction>
	
	<cffunction name="getUser" returntype="query">
		<cfargument name="userid" required="false" type="numeric" default="-1">
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
			,photo
			,createdat
			,deletedat
			
			from users
			where 1=1
			<cfif arguments.userid gte "0">
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
	
	<cffunction name="getUsersWithStatus" returntype="query">
		<cfset var q = "">
		
		<cfquery name="q">
			select 
			statuses.id as statusid
			,statuses.message
			,statuses.createdat
			,users.id as userid
			,users.urlid
			,users.firstName
			,users.lastName
			,users.photo
			from users
			left join statuses on statuses.userid = users.id 
			where statuses.deletedat is null
			and users.deletedat is null
			group by users.id
			order by statuses.createdat desc, users.lastName asc
			
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