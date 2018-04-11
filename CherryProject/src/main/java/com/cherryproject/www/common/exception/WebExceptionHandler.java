package com.cherryproject.www.common.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * @comment	웹 애플리케이션의 공통 예외 처리 클래스
 */

@ControllerAdvice
public class WebExceptionHandler {

	/**
	 * @comment	모든 종류의 예외를 처리
	 * @return	JSP파일 경로
	 */
	@ExceptionHandler (Exception.class)
	public String errorHandler(Exception e) {
		e.printStackTrace();
		return "/error";
	}
}
