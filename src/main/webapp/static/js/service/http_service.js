/**
 * generic class for Restful API calls
 */

'use strict';
App.factory('httpService', ['$http','$q', function($http,$q) {
	
		    
	var http_service = {
		post:post,
		get: get,
		getWithParam:getWithParam
	};
	
	return http_service;
	
	function post(url, paramObj){
		var deferred = $q.defer();
        $http.post(url, paramObj)
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
	
	function get(url) {
		var deferred = $q.defer();
        $http.get(url)
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
	
	function getWithParam(url, param) {
		var deferred = $q.defer();
	    $http.get(url, {params: {'param': param}})
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
	
}
]);