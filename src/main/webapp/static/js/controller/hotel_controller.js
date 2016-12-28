'use Strict'

App.controller('HotelController', [ 'LoginService', '$state', '$scope', '$q', '$filter', 
                      function(LoginService, $state, $scope, $q, $filter) {
	
	var hotel = this;
	hotel.selectedLocation = '';
	hotel.selLocForHotel = '';
	hotel.selectedHotelForBooking = '';
	hotel.rateForSelectedHotel =0;
	hotel.checkInDate = '';
	hotel.checkOutDate = '';

	hotel.hotelListForBooking = [];
	

	hotel.validationMessages = {
		'invalidcheckInDate' : '',
		'invalidcheckOutDate' : '',
		'dateInShouldBeBeforeOut': ''
	};
	
	clearAllErrorMessages();
	
	hotel.selectHotelsBasedOnLoc = selectHotelsBasedOnLoc;
	hotel.saveNewHotel = saveNewHotel;
	hotel.cancelNewHotel = cancelNewHotel;
	hotel.resetForm = resetForm;
	hotel.bookARoom = bookARoom;
	hotel.pullRateForSelHotel = pullRateForSelHotel;
	hotel.cancel = cancel;
	
	hotel.newHotel = {
		hotelName : '',
		noOfRooms : 0,
		ratePerRoom : 0,
		/*noOfAvailableRooms : 0,*/
		location : '',
		contact : {
			phone1 : 0,
			phone2 : 0,
			email : '',
			fullAddress : ''
		}
	}
	
	hotel.booking = {
		checkInDate : 0,
		checkOutDate : 0,
		noOfRoomsToBook : 0,
		hotel : {}
	}
	
	hotel.resetCopy = angular.copy(hotel.newHotel);
	
	function saveNewHotel(){
		clearAllErrorMessages();
		var hotelToSave = angular.copy(hotel.newHotel);
		hotelToSave = parseValues(hotelToSave);
		
		var success = validateInputs(hotelToSave);
		if(success) {
			var httpService = LoginService.saveHotel(hotelToSave);
			var deferred = $q.defer(); 
	    	httpService.then(
	            function (response) {
	            	hotel.newHotel = response.data;
	            	hotel.serverMessage.successMessage = 'Hotel saved successfully';
	            },
	            function(errResponse){
	            	hotel.serverMessage.errorMessage = 'Problem saving hotel';
	            });
	    	 return deferred.promise;
		}
	}
	
	//Fetch Hotel details based on location dropdown
	function selectHotelsBasedOnLoc() {
		clearAllErrorMessages();
		var httpService = LoginService.loadHotelBasedOnLoc(hotel.selLocForHotel);
		
		var deferred = $q.defer(); 
    	httpService.then(
            function (response) {
            	
            	if(response.data.length > 0) {
					hotel.hotelListOnLocation = response.data;
					hotel.hotelListForBooking = response.data;
            	}
            	if(response.data.length == 0) {
            		hotel.serverMessage.warningMessage = 'No Hotels available in the selected city';
            		hotel.hotelListOnLocation = response.data;
            	}
            },
            function(errResponse){
            	hotel.serverMessage.errorMessage = 'Problem fetching hotel list';
            });
    	 return deferred.promise;
	}
	
	//book a room
	function bookARoom() {
		clearAllErrorMessages();
		if($scope.checkInDate !== undefined || $scope.checkOutDate !== undefined){
			var cinparts = ($scope.checkInDate).split('-');
			var coutparts =  ($scope.checkOutDate).split('-');
			var mydate = new Date(cinparts[1]+"/"+cinparts[0]+"/"+cinparts[2]);
			var coutDate = new Date(coutparts[1]+"/"+coutparts[0]+"/"+coutparts[2]);
			
			hotel.booking.checkInDate = mydate;
			hotel.booking.checkOutDate = coutDate;
			hotel.booking.hotel = hotel.selectedHotelForBooking;
			hotel.booking.hotel.ratePerRoom = hotel.rateForSelectedHotel; 
			var success = valiadateDate(hotel.booking);
			if(success) {
				var httpService = LoginService.bookRoom(hotel.booking);
				var deferred = $q.defer(); 
				
				httpService.then(
					function (response) {
						hotel.booking = response.data;
						var amount = (hotel.booking.noOfRoomsToBook)*(hotel.booking.hotel.ratePerRoom);
						hotel.serverMessage.successMessage = 'Successfully Booked. Your booking id : ' +hotel.booking.id + 
						' You have to pay an amount of Rupees: '+amount;
					},
					function(errResponse){
						console.log("Error in fetcing location list")
					});
				 return deferred.promise;
			}
		} else {
			hotel.validationMessages.datesEnteredAreInvalid = true;
		}
	}
	
	// selected rate for the selected hotel in the selected location
	function pullRateForSelHotel() {
		hotel.rateForSelectedHotel = hotel.selectedHotelForBooking.ratePerRoom;
	}
	
	// go back to home page
	function cancelNewHotel(){
		hotel.newHotel = angular.copy(hotel.resetCopy);
		$state.go('dashboard');
	}
	
	function cancel(){
		$state.go('dashboard');
	}
	
	//clear the form for new entry
	function resetForm(){
		hotel.newHotel = angular.copy(hotel.resetCopy);
		$scope.newHotelForm.$setPristine();
		$scope.newHotelForm.$setValidity();
		$scope.newHotelForm.$setUntouched();
	}
	

	function clearAllErrorMessages() {
		hotel.serverMessage = {
			'errorMessage' : '',
			'successMessage' : '',
			'warningMessage' : ''
		};
		
		hotel.validationMessages = {
			'invalidcheckInDate' : false,
			'invalidcheckOutDate' : false,
			'dateInShouldBeBeforeOut': false,
			'rateShouldBeNumber': false ,
			'phone1ShouldBeNumber':false,
			'phone2ShouldBeNumber':false
		};
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
	
	// validation method for Hotel inputs
	function validateInputs(hotelToSave){
		var valid = true;
		if(isNaN(hotelToSave.ratePerRoom)) {
			hotel.validationMessages.rateShouldBeNumber = true;
			valid = false;
		}
		if( hotelToSave.contact !== undefined) {
			if(isNaN(hotelToSave.contact.phone1)) {
				hotel.validationMessages.phone1ShouldBeNumber = true;
				valid = false;
			}
			
			if(isNaN(hotelToSave.contact.phone2)) {
				hotel.validationMessages.phone2ShouldBeNumber = true;
				valid = false;
			}
		}
		return valid;
	}
	
	//validation method for booking dates
	function valiadateDate(booking) {
		var validDates = true;
		if(booking.checkInDate == undefined) {
			hotel.validationMessages.invalidcheckInDate = true;
			validDates  =false;
		}
		
		if(booking.checkOutDate == undefined) {
			hotel.validationMessages.invalidcheckOutDate = true;
			validDates = false;
		}
		
		if(validDates && booking.checkInDate > booking.checkOutDate) {
			hotel.validationMessages.dateInShouldBeBeforeOut = true;
			validDates = false;
		}
		
		return validDates;
	}
}
]);


/*
 * A new date directive in booking page
 * 
 * */

App.directive('jqdatepicker', function () {
    return {
        restrict: 'A',
        require: 'ngModel',
         link: function (scope, element, attrs, ngModelCtrl) {
            element.datepicker({
                dateFormat: 'dd-mm-yy',
                onSelect: function (date) {
                	if(attrs.name == 'checkindate') {
						scope.checkInDate = date;
					} else {
						scope.checkOutDate = date;
					}
                    scope.$apply();
                }
            });
        }
    };
});
