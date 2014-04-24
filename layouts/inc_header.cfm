<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Who's Who - Social Media for Whovians</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap theme -->
    <link href="css/bootstrap-theme.min.css" rel="stylesheet">


	<link href="css/main.css" rel="stylesheet">


        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
      <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
  </head>

  <body role="document">

	<div id="logo_holder" class="container">
		<a href="/" title="Who's Who - Social Network for Whovians"><img src="img/logo.png" border="0" alt="Who's Who - Social Network for Whovians"></a>
	</div>	

     
    <div class="navbar navbar-custom" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!---<a class="navbar-brand" href="#">Who's Who - Social Media for Whovians</a>--->
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">
          	<li><a href="/">Home</a></li>
            <cfif structKeyExists(session, "user")>
            	<li><a href="dsp_members.cfm">Members</a></li>
            	<li><a href="dsp_myaccount.cfm">My Account</a></li>
            	<li><a href="act_logout.cfm">Log-out</a></li>
            <cfelse>
            	<li><a href="dsp_login.cfm">Login</a></li>
            	<li><a href="dsp_login.cfm">Sign Up</a></li>
            </cfif>	
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
	
    <div class="bodycontainer container theme-showcase" role="main">
    
    	<cfif structKeyExists(session, "flash")>
			<div <cfif session.flash.code>class="alert alert-success"<cfelse>class="alert alert-danger"</cfif>>
				<cfoutput>#session.flash.message#</cfoutput>
			</div>	
			<cfset structDelete(session, "flash")>
		</cfif>	
    
   