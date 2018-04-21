<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyInfo Page</title>
<%@ include file="/WEB-INF/views/common/headPart.jsp" %>
</head>
<body>
<%@ include file="/WEB-INF/views/common/bodyHeader.jsp" %>

<a href="/www/cardList">내 명함 보기</a>
<a href="/www/management">받은 명함 보기</a>

</body>
</html>