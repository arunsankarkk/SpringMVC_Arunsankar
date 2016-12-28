'use Strict'

App.controller('DashboardController', [ 'LoginService', '$state', function(LoginService, $state) {
	
	var dashboard = this;
	
	dashboard.tittle = "DASHBOARD FOR HOTEL RESERVATION"
	dashboard.locationList = [];
	
	function fetchLocationList() {
		LoginService.fetchLocationList();	
	}
	
	if(dashboard.locationList.length == 0) {
		fetchLocationList();
	}
		
}
]);