<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<body class="ng-cloak" >
      <div class="generic-container" >
          <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Adding a new Hotel</span></div>
            <div class="newHotelForm">
              <form  name="newHotelForm" class="form-horizontal">
              	
              	<div class="alert alert-success" ng-if="hotelctrl.serverMessage.successMessage !== ''" class="row">
              		<label>{{hotelctrl.serverMessage.successMessage}} </label>
              	</div>
              	
              	<div class="alert alert-danger" ng-if="hotelctrl.serverMessage.errorMessage !== ''" class="row">
              		<label>{{hotelctrl.serverMessage.errorMessage}} </label>
              	</div>
              	
              	 <label class="col-md-2 control-lable" for="file">Hotel Name</label>
                    <div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.hotelName" name="newHotel" class="username form-control input-sm" 
                        			placeholder="User name" required ng-minlength="3"/>
                  	</div>
                  	
                  	<label class="col-md-2 control-lable" for="file">Location</label>
                  	<div class="col-md-4">
						<select name="mySelect" id="mySelect" class= "locationselect" ng-model="hotelctrl.selectedLocation" 
						ng-options="loc for loc in locationList">    
						</select>                    	
                  	</div>
                  	
                  <!-- 	<label class="col-md-2 control-lable" for="file">Number of Rooms</label>
                  	<div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.noOfRooms" name="noOfRooms" class="username form-control input-sm" 
                        			 required ng-maxlength="5"/>
                  	</div> -->
                  	
                  	<label class="col-md-2 control-lable" for="file">Rate Per Room</label>
                  	<div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.ratePerRoom" name="ratePerRoom" class="username form-control input-sm" 
                        		 required ng-maxlength="5"/>
                        <div class="has-error" ng-show="newHotelForm.$dirty">
							<span ng-show="newHotelForm.ratePerRoom.$error.required">Rate is mandatory</span>
							<span ng-if="hotelctrl.validationMessages.rateShouldBeNumber">Rate should be numbers only</span>
						</div>
                  	</div>

                  	<div class="col-md-12" >
                  		<h3>Hotel Contacts</h3>
                  	</div>
                  	
                  	<label class="col-md-2 control-lable" for="file">Land Line</label>
                  	<div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.contact.phone1" name="phone1" class="username form-control input-sm" 
                        			placeholder="phone1" required ng-minlength="3"/>
                        <div class="has-error" ng-show="newHotelForm.$dirty">
							<span ng-show="newHotelForm.phone1.$error.required">Landline is mandatory</span>
							<span ng-if="hotelctrl.validationMessages.phone1ShouldBeNumber">Landline should be numbers only</span>
						</div>
                  	</div>
                  	
                  	<label class="col-md-2 control-lable" for="file">Mobile</label>
                  	<div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.contact.phone2" name="phone2" class="username form-control input-sm" 
                        			placeholder="phone2" />
                        <div class="has-error" ng-show="newHotelForm.$dirty">
							<span ng-show="newHotelForm.phone2.$error.required">Landline is mandatory</span>
							<span ng-if="hotelctrl.validationMessages.phone2ShouldBeNumber">Mobile should be numbers only</span>
						</div>
                  	</div>
                  	
                  	<label class="col-md-2 control-lable" for="file">EMail</label>
                  	<div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.contact.email" name="email" class="username form-control input-sm" 
                        			placeholder="E Mail" required ng-minlength="3"/>
                         <div class="has-error" ng-show="newHotelForm.$dirty">
							<span ng-show="newHotelForm.email.$error.required">EMail is mandatory</span>
						</div>
                  	</div>
                  	
                  	<label class="col-md-2 control-lable" for="file">Address</label>
                  	<div class="col-md-4">
                        <input type="text" ng-model="hotelctrl.newHotel.contact.fullAddress" name="address" class="username form-control input-sm" 
                        			placeholder="address" required ng-minlength="3"/>
                        <div class="has-error" ng-show="newHotelForm.$dirty">
							<span ng-show="newHotelForm.email.$error.required">Address is mandatory</span>
						</div>
                  	</div>
                 
                 	<div class="row ">
                 		<div class="form-actions floatRight">
	                 		<button type="button" class="btn btn-success" ng-click="hotelctrl.saveNewHotel()">Save</button>
	                 		<button type="button" class="btn btn-warning" ng-click="hotelctrl.cancelNewHotel()">Cancel</button>
	                 		<button type="button" class="btn btn-info" ng-click="hotelctrl.resetForm()">Reset</button>
	                 	</div>
                 	</div>
                 	
                </form>
              </div>
            </div>
           </div>
          
	</body>
</html>