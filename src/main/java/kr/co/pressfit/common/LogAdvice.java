package kr.co.pressfit.common;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component // �뒪�봽留곸뿉�꽌 愿�由ы븯�뒗 bean
@Aspect // AOP bean
public class LogAdvice {

 private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);


 @Around("execution(* kr.co.pressfit.controller..*Controller.*(..))"
         + " or execution(* kr.co.pressfit.service..*Impl.*(..))"
         + " or execution(* kr.co.pressfit.dao..*Impl.*(..))")
 public Object logPrinnt(ProceedingJoinPoint joinPoint) throws Throwable{

     long start = System.currentTimeMillis();

     Object result = joinPoint.proceed();

     String type = joinPoint.getSignature().getDeclaringTypeName();
     String name = "";
     if (type.indexOf("Controller") > -1) {
         name = "Controller:";
     } else if (type.indexOf("Service") > -1) {
         name = "ServiceImpl:";
     } else if (type.indexOf("DAO") > -1) {
         name = "DAO:";
     }
     
     logger.info(name+type+"."+joinPoint.getSignature().getName()+"()");

     logger.info(Arrays.toString(joinPoint.getArgs()));

     long end = System.currentTimeMillis();

     long time = end-start;
     logger.info("�떎�뻾 �떆媛�:"+time);
     return result;
 }
}
