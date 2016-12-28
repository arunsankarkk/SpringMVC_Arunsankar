<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  
  	<body class="ng-cloak" >
      <div class="generic-container" >
          <div class="panel panel-default">
            <div class="panel-heading"><span class="lead">Login Form</span></div>
            <div class="formcontainer">
              <form  ng-submit="lgctrl.signIn()" name="myForm1" class="form-horizontal">
              	 <label class="col-md-2 control-lable" for="file">User Name</label>
                    <div class="col-md-4">
                        <input type="text" ng-model="username" name="username" class="username form-control input-sm" 
                        			placeholder="User name" required ng-minlength="3"/>
                  </div>
                  <div>
	                  <label class="col-md-2 control-lable" for="file">Password</label>
	                  <div class="col-md-4">
	                        <input type="text" ng-model="password" name="password" class="username form-control input-sm" 
	                        			placeholder="Password" required ng-minlength="3"/>
	                  </div>
                  </div>
                  <div class="row">
                       <div class="form-actions floatRight">
                           <input type="submit"  class="btn btn-warning btn-sm" />
                       </div>
                   </div>
                   
                   <div class="row">
                          <a href="" ng-click="lgctrl.createUser">User Registration</a>
                   </div>
                </form>
              </div>
     </div>
    </div>
    
      
   </body>
          
    
  </head>
</html>