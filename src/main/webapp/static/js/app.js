'use strict';

var App = angular.module('myApp',['ui.router']);

App.config(['$stateProvider', function($stateProvider) {

$stateProvider
.state('login', {
    url: "/login",
    views: {
        "main": {
            templateUrl: "login",
            controller: "LoginController",
            controllerAs: "lgctrl"
        }
    }
}).state('createUser', {
		url:"/createUser",
		views:{
			"main":{
				templateUrl: "createUser",
	            controller: "userController",
	            controllerAs: "userCtrl"
			}
		}
	}).state('addNewHotel', {
		url:"/newHotel",
		views:{
			"main":{
				templateUrl: "newHotel",
	            controller: "HotelController",
	            controllerAs: "hotelctrl"
			}
		}
	}).state('hotelBooking', {
		url:"/hotelBooking",
		views:{
			"main":{
				templateUrl: "hotelBooking",
	            controller: "HotelController",
	            controllerAs: "hotelctrl"
			}
		}
	}).state('dashboard', {
		url: "/dashboard",
		views:{
			"main":{
				templateUrl: "dashboard",
				controller: "DashboardController",
				controllerAs: "dbctrl"
			}
		}
	}).state('lowestTariff', {
		url: "/lowestTariff",
		views:{
			"main":{
				templateUrl: "lowestTariff",
				controller: "HotelController",
				controllerAs: "hotelctrl"
			}
		}
	});

}]);


