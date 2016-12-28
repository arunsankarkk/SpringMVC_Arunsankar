package com.reservation.hotel.aspect;

import java.time.LocalDateTime;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class TimeLoggingAspect {
	

	@Before("execution(* com.reservation.hotel.service.*.*(..))")
	public void before(){
		System.out.println("@Before: Before executing service method - "+ LocalDateTime.now());
	}
	
	@After("execution(* com.reservation.hotel.service.*.*(..))")
	public void after(){
		System.out.println("@After: After executing service method - "+LocalDateTime.now());
	}
}
