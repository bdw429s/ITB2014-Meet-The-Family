<cfoutput>
<!--- Controller / Logic --->


<!--- View Code --->
<cfinclude template="layouts/inc_header.cfm">
<h1>All of time and space, everything that ever happened or ever will - where do you want to start?</h1>

<div class="row">

    <div class="col-md-5">
    	<form method="post" action="act_login.cfm" class="form-signin" role="form">

		    <h2 class="form-signin-heading">
		
		        Please sign in
		
		    </h2>
		    <input class="form-control" type="email" name="email" autofocus="" required="" placeholder="Email address"></input>
		    <input class="form-control" type="password" name="password" required="" placeholder="Password"></input>
		    <label class="checkbox">
		        <input type="checkbox" value="remember-me"></input>
		
		         Remember me
		                
		
		    </label>
		    <button class="btn btn-lg btn-primary btn-block" type="submit">
		
		        Sign in
		
		    </button>

		</form>
    	
    </div>
    <div class="col-md-1">
    	
    </div>
    
    <div class="col-md-5">
        <form method="post" action="act_register.cfm" class="form-signin" role="form">

		    <h2 class="form-signin-heading">
		
		        Join the Whovians
		
		    </h2>
		    <input class="form-control" type="email" name="email" autofocus="" required="" placeholder="Email address"></input>
		    <input class="form-control" type="password" name="password" required="" placeholder="Password"></input>
		    <br>
		    <input class="form-control" type="text" name="firstName" autofocus="" required="" placeholder="First Name"></input>
		    <input class="form-control" type="text" name="lastName" autofocus="" required="" placeholder="Last Name"></input>
		    <br>
		    
		    
		    <button class="btn btn-lg btn-primary btn-block" type="submit">
		
		        Sign Up Now
		
		    </button>

		</form>
    </div>
    

</div>





<cfinclude template="layouts/inc_footer.cfm">
</cfoutput>