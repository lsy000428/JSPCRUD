<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="<%= (String)session.getAttribute(\"test\") %>"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="message">
	<p>

		<fmt:message key="main" var="mains" />
		<fmt:message key="Login" var="login" />
	<p>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div>

		${mains } 
		${param.passwd } <input type="button" value=${login }
			onclick="location.href='LoginForm.do'"></input>
		
	</div>
	
	<input type="button" value="한국어"
			onclick="location.href='main.do?lang=ko'"></input>
	<input type="button" value="ENGLISH"
			onclick="location.href='main.do?lang=en'"></input>

</body>
</html>