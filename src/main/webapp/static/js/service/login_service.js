'use strict';

App.factory('LoginService', ['urlConstants','httpService','$rootScope','$q','$state',
                             function(urlConstants, httpService, $rootScope, $q, $state){

    var loginfactory = {
            login:login,
            fetchLocationList:fetchLocationList,
            saveHotel:saveHotel,
            loadHotelBasedOnLoc:loadHotelBasedOnLoc,
            bookRoom:bookRoom
        };
    
    return loginfactory;
    
    function login(login) {
    	var deferred = $q.defer(); 
    	httpService.post(urlConstants.REST_SERVICE_LOGIN_URI, login)
    	.then(
            function (response) {
            	$rootScope.navigateToLogin = true;
            	$rootScope.locationList = response;
	        	$state.go('dashboard');
	        	
            },
            function(errResponse){
            	console.log("Error in login");
            });
    	 return deferred.promise;
    }
    
    function fetchLocationList(){
    	var deferred = $q.defer(); 
    	httpService.get(urlConstants.LOCATION_LIST)
    	.then(
            function (response) {
            	console.log("location List fetched");
            	$rootScope.locationList = response.data;
            },
            function(errResponse){
            	console.log("Error in fetcing location list")
            });
    	 return deferred.promise;
    }
    
    function saveHotel(hotel){
    	var deferred = $q.defer(); 
		
    	httpService.post(urlConstants.SAVE_HOTEL, hotel)
    	.then(
    			function (response) {
   				 deferred.resolve(response);
   			},
               function(errResponse){
   				 deferred.reject(errResponse);
   			}
   		);
    	 return deferred.promise;
    }
    
    function loadHotelBasedOnLoc(location) {
    	var deferred = $q.defer(); 
    	httpService.getWithParam(urlConstants.HOTEL_LIST_ON_TARIFF, location)
    	.then(
			 function (response) {
				 deferred.resolve(response);
			},
            function(errResponse){
				 deferred.reject(errResponse);
			}
		);
    	 return deferred.promise;
    }
    
    function createUser(){
    	var deferred = $q.defer(); 
    	httpService.get(urlConstants.NEW_HOTEL_URI)
    	.then(
            function (response) {
            	deferred.resolve(response);
            },
            function(errResponse){
            	deferred.reject(response);
            });
    	 return deferred.promise;
    }
    
    function bookRoom(booking){
    	var deferred = $q.defer(); 
    	httpService.post(urlConstants.BOOK_ROOM, booking)
    	.then(
            function (response) {
            	deferred.resolve(response);
            },
            function(errResponse){
            	deferred.reject(errResponse);
            });
    	 return deferred.promise;
    }

  //parse the values to the appropriate types before saving the hotel
	function parseValues(hotelToSave) {
		hotelToSave.noOfRooms = parseInt(hotelToSave.noOfRooms);
		hotelToSave.ratePerRoom = parseInt(hotelToSave.ratePerRoom);
		/*hotelToSave.noOfAvailableRooms = parseInt(hotelToSave.noOfRooms);*/
		hotelToSave.location = hotel.selectedLocation;
		hotelToSave.contact.phone1 = parseInt(hotelToSave.contact.phone1);
		hotelToSave.contact.phone2 = parseInt(hotelToSave.contact.phone2);
		
		return hotelToSave;
	}
    
    

}]);