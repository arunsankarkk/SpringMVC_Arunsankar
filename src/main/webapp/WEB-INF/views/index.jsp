<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    	<title>HOTEL ROOM RESERVATION</title>  
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
     	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery.ui.all.css"/>
    	<link rel="stylesheet" href="http://ui-grid.info/release/ui-grid.css" type="text/css" />
    	<link rel="stylesheet" href="static/css/app.css" ></link>
  </head>
  
   <body ng-app="myApp">
   <p>HOTEL BOOKING</p>
   	 <div class="generic-container" ng-controller="LoginController as lgctrl" ng-if="!navigateToLogin">
          <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Login Form</span></div>
            <div class="formcontainer" >
              <form  ng-submit="lgctrl.signIn()" name="myForm1" class="form-horizontal">
              	 <label class="col-md-2 control-lable" for="file">User Name</label>
                    <div class="col-md-4">
                        <input type="text" ng-model="lgctrl.username" name="username" class="username form-control input-sm" 
                        			placeholder="User name" required ng-minlength="3"/>
                  </div>
                  <div>
	                  <label class="col-md-2 control-lable" for="file">Password</label>
	                  <div class="col-md-4">
	                        <input type="text" ng-model="lgctrl.password" name="password" class="username form-control input-sm" 
	                        			placeholder="Password" required ng-minlength="3"/>
	                  </div>
                  </div>
                  <div class="row">
                       <div class="form-actions floatRight">
                           <input type="submit"  class="btn btn-warning btn-sm" />
                       </div>
                   </div>
                </form>
              </div>
     		</div>
    </div>
    
       <div class="contentpanel" id="contentpanel">
			<div ui-view="main"></div>
		</div>
		
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="static/lib/angular-ui-router.min.js"></script>
      <script src="static/lib/ui-grid.js"></script>
      <script src="static/js/app.js"></script>
      
      <script src="static/js/controller/login_controller.js"></script>
	  <script src="static/js/controller/dashboard_controller.js"></script>
	  <script src="static/js/controller/hotel_controller.js"></script>
	  <!--  <script src="static/js/service/user_service.js"></script>
	   <script src="static/js/service/dashboard_service.js"></script>
	    <script src="static/js/service/team_service.js"></script>  -->
	   <script src="static/js/service/login_service.js"></script>
	   <script src="static/js/service/http_service.js"></script>
	   <script src="static/js/service/url_service.js"></script> 
      
    </body>
</div>