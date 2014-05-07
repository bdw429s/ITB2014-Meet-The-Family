component extends="testbox.system.testing.BaseSpec"{
     
     // executes before all suites
     function beforeAll(){
     	userService = application.wirebox.getInstance( 'userService' );
     }

     // executes after all suites
     function afterAll(){}

     // All suites go in here
     function run(){

		describe("A Suite that tests the User Service", function(){
          it("rejects logins with email shorter than 5 chars", function(){
               expect( userService.checkLogin( email='rose', password='rose') ).toBe(0);
          	});
          	
          it("rejects logins with 0 length passwords", function(){
               expect( userService.checkLogin( email='rose@whoswho.com', password='') ).toBe(0);
          	});	
          	
          it("rejects logins of valid users with bad passwords", function(){
               expect( userService.checkLogin( email='rose@whoswho.com', password='rosetyler') ).toBe(0);
               expect( userService.checkLogin( email='rose@whoswho', password='rosetyler') ).toBe(0);
          	});	
          
          it("returns a valid user id if given valid Login Credentials", function(){
               expect( userService.checkLogin( email='rose@whoswho.com', password='rose') ).notToBe(0);
          	});	
          
          	
    	});


     }

}