<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="<%=(String) session.getAttribute(\"test\")%>" />
<%
request.setCharacterEncoding("UTF-8");
%>
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="message">
  <p>
    <fmt:message key="ID" var="id" />
    <fmt:message key="PW" var="pw" />
    <fmt:message key="Login" var="login" />
    <fmt:message key="Cancel" var="cancel" />
    <fmt:message key="JOIN" var="join" />
    <fmt:message key="LANGUAGE" var="lang" />
  <p>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
(href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css")>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
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
  <div class="container">

    
        <input type="button" value="한국어" class="btn btn-primary" onclick="changeLanguage('ko')"></input>
        <input type="button" value="ENGLISH" class="btn btn-primary" onclick="changeLanguage('en')"></input>

    <form method="post" action="ActionForm.do">
    <h1>${login}</h1>
      <table border="1">
        <tr>
          <td>${id}</td>
          <td><input type="text" name="id"></td>
        </tr>
        <tr>
          <td>${pw}</td>
          <td><input type="password" name="passwd" /></td>
        </tr>
        <tr colspan="2" align="center">
          <td><input type="submit" value=${login} /> <input type="reset" value=${cancel} /></td>
        </tr>
      </table>
    </form>
    <a href="JoinForm.do" class="btn btn-primary">${join}</a> <br />
    <br />
    <br />
  </div>
</body>
</html>