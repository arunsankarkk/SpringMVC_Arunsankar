'use strict';

App.controller('LoginController', [ 'LoginService', '$state','$rootScope',
                                function( LoginService, $state, $rootScope) {
	
	var login = this;
	login.username='';
	login.password='';
    
	$rootScope.navigateToLogin = false;
	
	login.signIn = signIn;

	function signIn() {
    	var parms = {'username': login.username, 'password':login.password}
    	var http = LoginService.login(parms);
    }
	
}]);