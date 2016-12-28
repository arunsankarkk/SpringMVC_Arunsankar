<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  	<body class="ng-cloak" >
      <div class="generic-container" >
          <div class="panel panel-default">
            <div class="panel-heading"><span class="lead"> {{dbctrl.title}} </span></div>
           	 	<ul class="nav navbar-nav navbar-center">    
					<li><a href="#newHotel"><i class="fa fa-home"></i>NEW HOTEL</a></li>    
					<li><a href="#hotelBooking"><i class="fa fa-shield"></i>BOOK A ROOM</a></li>    
					<li><a href="#createUser"><i class="fa fa-comment"></i>CREATE USER</a></li>   
					<li><a href="#lowestTariff"><i class="fa fa-comment"></i>VIEW LOWEST PRICED HOTEL</a></li>    
				</ul>
           </div>
          </div>
	</body>
</html>