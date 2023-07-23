<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsBean"%>
<%@ page import="bbs.BbsDao"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<fmt:setLocale value="<%=(String) session.getAttribute(\"test\")%>" />
<%
request.setCharacterEncoding("UTF-8");
%>
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="message">
	<p>
		<fmt:message key="WRITE" var="write" />
		<fmt:message key="WRITETOOL" var="wt" />
		<fmt:message key="CONTENTTITLE" var="ct" />
		<fmt:message key="CONTENTINSIDE" var="ci" />
		<fmt:message key="PREV" var="prev" />
		<fmt:message key="LIST" var="list" />
	<p>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>struts 게시판 웹사이트</title>
<style>
  table.custom-table {
    border-collapse: collapse;
    width: 100%;
  }
  table.custom-table td,
  table.custom-table th {
    border: 1px solid #cccccc;
    padding: 8px;
    text-align: center;
  }
  input,
  textarea {
    margin-bottom: 16px;
    width: 100%;
  }
</style>
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
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}
	%>
	<div class="container">
		<div class="row">
			<form method="post" action="writeActionForm.do">
			<input type="button" value="한국어" class="btn btn-primary" onclick="changeLanguage('ko')"></input>
    		<input type="button" value="ENGLISH" class="btn btn-primary" onclick="changeLanguage('en')"></input>
				<table class="custom-table" style="text-align: center; border: 1px solid #cccccc">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">${wt }</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control"
								placeholder="${ct}" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="${ci}"
									name="content" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right"
					value=${write }>
			</form>
		</div>
	</div>
	<a href="LoginForm.do" class="btn btn-primary">${prev }</a>
	<a href="bbs.do" class="btn btn-primary">${list }</a>
</body>
</html>
