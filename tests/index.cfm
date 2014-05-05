<h1>Who's Who - Tests</h1>

<h2>MX Unit Tests</h2>

<cfset r = new testbox.system.testing.compat.runner.DirectoryTestSuite()
				.run( directory="#expandPath( '/tests/mxunit' )#", 
					  componentPath="tests.mxunit" )>
<cfoutput>#r.getResultsOutput( 'simple' )#</cfoutput>


<h2>BDD Tests</h2>
<cfset r = new testbox.system.testing.TestBox( "tests.specs.BDDTests" ) >
<cfoutput>#r.run(reporter="simple")#</cfoutput>