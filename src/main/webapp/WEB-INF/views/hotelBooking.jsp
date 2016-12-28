<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<body class="ng-cloak" >
      <div class="generic-container" >
          <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Book Room</span></div>
            <div class="newHotelForm">
              <form  name="hotelBookingForm" class="form-horizontal">
              
	              	<div class="alert alert-success" ng-if="hotelctrl.serverMessage.successMessage !== ''" class="row">
	              		<label>{{hotelctrl.serverMessage.successMessage}} </label>
	              	</div>
	              	
	              	<div class="alert alert-danger" ng-if="hotelctrl.serverMessage.errorMessage != ''" class="row">
	              		<label>{{hotelctrl.serverMessage.errorMessage}} </label>
	              	</div>
              	
              		<label class="col-md-2 control-lable" for="file">Location</label>
	               	<div class="col-md-4">
						<select name="mySelect1" id="mySelect1" class= "locationselect" ng-model="hotelctrl.selLocForHotel" 
							ng-options="loc for loc in locationList" ng-change="hotelctrl.selectHotelsBasedOnLoc()">    
						</select>                    	
	               	</div>
	               	
	               	<label class="col-md-2 control-lable" for="file">Hotel Name</label>
	               	<div class="col-md-4">
						<select name="mySelect2" id="mySelect2" class= "locationselect" ng-model="hotelctrl.selectedHotelForBooking" 
							ng-options="hotlst.hotelName for hotlst in hotelctrl.hotelListForBooking" 
							ng-change="hotelctrl.pullRateForSelHotel()">     
						</select>                    	
	               	</div>
               		
               		<label class="col-md-2 control-lable" >Rate</label>
	              	<div class="col-md-4">
	                     <input type="text" ng-model="hotelctrl.rateForSelectedHotel" name="ratePerRoom" ng-disabled="true"
	                     class="username form-control input-sm" />
	   				</div>
	   				
	   				
					
	   				<!-- <label class="col-md-2 control-lable" >Available Rooms</label>
	              	<div class="col-md-4">
	                    <input type="text" ng-model="hotelctrl.booking.hotel.noOfRooms" name="noOfRooms" 
	                     class="username form-control input-sm" required ng-maxlength="5" ng-disabled="true"/>
	   				</div>-->
	   				
	   				<label class="col-md-2 control-lable" >No of Rooms</label>
	              	<div class="col-md-4">
	                    <input type="text" ng-model="hotelctrl.booking.noOfRoomsToBook" name="noOfRoomsToBook" 
	                     class="username form-control input-sm" required ng-maxlength="1"/>
	   				</div> 
	   				
	              	<label class="col-md-2 control-lable" >Check-in Date</label>
	              	<div class="col-md-4">
		              	<input type="text"  jqdatepicker required name="checkindate" 
		                   ng-model="hotelctrl.checkInDate" class="username form-control input-sm" placeholder="Checkin date"/>
		                <div class="has-error" ng-show="hotelBookingForm.$dirty">
							<span ng-show="hotelBookingForm.checkindate.$error.required">Check-in date is mandatory</span>
							<span ng-if="hotelctrl.validationMessages.invalidcheckInDate">Check-in date is invalid </span>
						</div>
	   				</div>
	   				
	   				<label class="col-md-2 control-lable" >Check out Date</label>
	              	<div class="col-md-4">
	                     <input  type="text" jqdatepicker required  ng-model="hotelctrl.checkOutDate" name="checkoutdate" 
	                      class="username form-control input-sm" placeholder="Checkout date" />
	                     <div class="has-error" ng-show="hotelBookingForm.$dirty">
							<span ng-show="hotelBookingForm.checkoutdate.$error.required">Check-out date is mandatory</span>
							<span ng-if="hotelctrl.validationMessages.invalidcheckOutDate">Checkout date is invalid </span>
						</div>
	   				</div>
                  	
                  	<div class="row">
                 		<div class="form-actions floatRight">
	                 		<button type="button" class="btn btn-success" ng-click="hotelctrl.bookARoom()">Book Room</button>
	                 		<button type="button" class="btn btn-warning" ng-click="hotelctrl.cancel()">Cancel</button>
	                 	</div>
                  	</div>
                  	
                  	<div class="alert alert-danger" ng-if="hotelctrl.validationMessages.dateInShouldBeBeforeOut" class="row">
	              		<span>Checkout date should be after Check-in date </span>
	              	</div>
	              	<div class="alert alert-danger" ng-if="hotelctrl.validationMessages.datesEnteredAreInvalid" class="row">
	              		<span>Dates entered are invalid </span>
	              	</div>
	              	
              </form>
             </div>
          </div>
       </div>

</body>
</html>