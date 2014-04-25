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

     function testStatusServiceInsert(){
     	  statusService = new services.statusService();
     	
          $assert.throws( function() { 
          						statusService.insert(  ); 
          						} );
          $assert.throws( function() { 
          						statusService.insert( 1 ); 
          						} );
          $assert.throws( function() { 
          						statusService.insert( 1, {} ); 
          						} );						
          $assert.assert( statusService.insert( '' ).status eq 500, "Expect error if userid is empty string os 0" );
          $assert.assert( statusService.insert( 0 ).status eq 500, "Expect error if userid is empty string os 0" );
          						
          $assert.assert( statusService.insert( -1, {message="test"} ).status eq 200, "Expect successif passes correct information" );
          $assert.typeOf( "struct", statusService.insert( -1, {message="test"} ) );
          
     }


}