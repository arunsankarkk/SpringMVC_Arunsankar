<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	
	<body class="ng-cloak" >
      <div class="generic-container" >
          <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Adding a new Hotel</span></div>
            <div class="newHotelForm">
              <form  name="hotelTariffForm" class="form-horizontal">
              	
              	<div class="alert alert-warning" ng-if="hotelctrl.serverMessage.warningMessage !== ''" class="row">
              		<label>{{hotelctrl.serverMessage.warningMessage}} </label>
              	</div>
              	
              	<div class="alert alert-danger" ng-if="hotelctrl.serverMessage.errorMessage !== ''" class="row">
              		<label>{{hotelctrl.serverMessage.errorMessage}} </label>
              	</div>
              	
              	<label class="col-md-2 control-lable" for="file">Location</label>
               	<div class="col-md-4">
					<select name="mySelect" id="mySelect" class= "locationselect" ng-model="hotelctrl.selLocForHotel" 
					ng-options="loc for loc in locationList" ng-change="hotelctrl.selectHotelsBasedOnLoc()">    
					</select>                    	
               	</div>
                
                <div class="row">
                	<div class="col-md-12 control-lable">
                		<h2> Hotels based on Location and tariff</h2>
                	</div>
                </div>
                
               
				<div class="tablecontainer">
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>Hotel Name.</th>
                              <th>Rate per Room</th>
                              <th>Location</th>
                      <!--         <th>Available Room</th> -->
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="hotel in hotelctrl.hotelListOnLocation">
                              <td><span ng-bind="hotel.hotelName"></span></td>
                              <td><span ng-bind="hotel.ratePerRoom"></span></td>
                              <td><span ng-bind="hotel.location"></span></td>
                              <!-- <td><span ng-bind="hotel.noOfAvailableRooms"></span></td> -->
                              
                          </tr>
                      </tbody>
                  </table>
				</div>
                
                <div class="row ">
               		<div class="form-actions floatRight">
                		<button type="button" class="btn btn-warning" ng-click="hotelctrl.cancel()">Cancel</button>
                	</div>
               	</div>
                 	
              </form>
             </div>
          </div>
       </div>

</body>
</html>