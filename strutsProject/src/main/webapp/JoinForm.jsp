<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="<%= (String)session.getAttribute(\"test\") %>"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="message">
	<p>
		<fmt:message key="ID" var="id" />
		<fmt:message key="PW" var="pw" />
		<fmt:message key="NAME" var="name" />
		<fmt:message key="Cancel" var="cancel" />
		<fmt:message key="JOIN" var="join"/>
		<fmt:message key="AGE" var="age"/>
		<fmt:message key="BackToLogin" var="btl"/>
	<p>
</fmt:bundle>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// 언어 변경
function changeLanguage(lang) {
  $.ajax({
    url: "main.do",
    method: "GET",
    data: { lang: lang },
    success: function (data) {
      location.reload();
    },
    error: function (error) {
      alert("언어 변경 중 에러가 발생했습니다. 다시 시도해주세요.");
    },
  });
}
</script>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
%>
	<input type="button" value="한국어" class="btn btn-primary" onclick="changeLanguage('ko')"></input>
    <input type="button" value="ENGLISH" class="btn btn-primary" onclick="changeLanguage('en')"></input>
	<form method="post" action="JoinActionForm.do">
		<h1>${join}</h1>
		<table border="1">
			<tr>
				<td>${id }</td>
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<td>${pw }</td>
				<td><input type="password" name="pw" /></td>
			</tr>
			<tr>
				<td>${name }</td>
				<td><input type="text" name="name" /></td>
			</tr>
			<tr>
				<td>${age }</td>
				<td><input type="number" name="age" /></td>
			</tr>
			<tr colspan="2" align="center">
				<td><input type="submit" value=${join } /><input type="reset"
					value=${cancel } /></td>
			</tr>
		</table>
	</form>
</body>
<a href="LoginForm.do" class="btn btn-primary">${btl }</a>
</html>