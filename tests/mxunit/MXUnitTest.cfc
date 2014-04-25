component displayName="MX Unit Tests" extends="testbox.system.testing.BaseSpec"{
     
     // executes before all tests
     function beforeTests(){}

     // executes after all tests
     function afterTests(){}

	function testStatusServiceGetStatuses(){
          statusService = new services.statusService();
          
          $assert.typeOf( "query", statusService.getStatuses() );
          $assert.assert( statusService.getStatuses().recordcount gt 0, "Expect recordcount to be greater than 0" );
          $assert.assert( statusService.getStatuses(999999).recordcount eq 0, "Expect recordcount to be equal to 0" );
          $assert.throws( function() { 
          						statusService.getStatuses('hello') 
          						} );
          						
          						
     }

     function testStatusService(){
          $assert.includesWithCase( "hello", "he" );
          $assert.includesWithCase( [ "Monday", "Tuesday" ] , "Monday" );
     }


}