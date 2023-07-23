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
		<fmt:message key="WRITETOOL" var="wt" />
		<fmt:message key="CONTENTTITLE" var="ct" />
		<fmt:message key="WRITER" var="writer" />
		<fmt:message key="DATE" var="date" />
		<fmt:message key="CONTENTINSIDE" var="ci" />
		<fmt:message key="PREV" var="prev" />
		<fmt:message key="LIST" var="list" />
		<fmt:message key="UPDATE" var="update" />
		<fmt:message key="DELETE" var="delete" />
	<p>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width" , initial-scale="1">
<title>struts 게시판 웹사이트</title>
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
	//메인 페이지로 이동했을 때 세션에 값이 담겨져 있는지 체크
	PrintWriter scripts = response.getWriter();
	String userID = null;

	if (session.getAttribute("user_id") != null) {
		userID = (String) session.getAttribute("user_id");
	}
	scripts.println("ID : "+userID);
	//bbsID를 초기화시키고
	//'bbsID' 라는 데이터가 넘어온 것이 존재한다면 캐스팅을하여 변수에 담는다.
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	//만약 넘어온 데이터가 없다면
	if (bbsID == 0) {
		PrintWriter script = response.getWriter();
		script.println("<script");
		script.println("alert('유효하지 않는 글 입니다.')");
		script.println("location.href='bbs.jsp'");
		script.println("</script");
	}
	//유효한 글이라면 구체적인 정보를 'bbs'라는 인스턴스에 담는다.
	BbsBean bbs = new BbsDao().getBbs(bbsID);
	%>
	
	
			
			
	<div class="container">
		<div class="row">
			<form method="post" action="writeAction.jsp">
	<input type="button" value="한국어" class="btn btn-primary" onclick="changeLanguage('ko')"></input>
    <input type="button" value="ENGLISH" class="btn btn-primary" onclick="changeLanguage('en')"></input>
				<table class="custom-table" style="text-align: center; border: 1px solid #cccccc">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center;">${wt}</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td style="width: 20%;">${ct }</td>
							<td colspan="2"><%=bbs.getBbsTitle()%></td>
						</tr>
						<tr>
							<td>${writer }</td>
							<td colspan="2"><%=bbs.getUserID()%></td>
						</tr>
						<tr>
							<td>${date}</td>
							<td colspan="2"><%=bbs.getBbsDate()%></td>
						</tr>
						<tr>
							<td>${ci}</td>
							<td colspan="2" style="height: 200px; text-align: left;"><%=bbs.getBbsContent()%></td>
						</tr>
					</tbody>
				</table>
				<a href="bbs.jsp" class="btn btn-primary">${list }</a>
				<!-- 글쓴이가 본인이라면 삭제 및 수정 가능하게  -->
				<%
				if (userID != null && userID.equals(bbs.getUserID())) {
				%>
				<a href="Update.do?bbsID=<%=bbsID%>" class="btn btn-primary">${update }</a>
				<a onclick="return confirm('정말로 삭제하시겠습니까?')"
					href="DeleteActionForm.do?bbsID=<%=bbsID%>" class="btn btn-primary">${delete }</a>
				<%
				}
				%>
			</form>
		</div>
	</div>
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
</style>
	<a href="LoginForm.do" class="btn btn-primary">${prev }</a>
</body>
</html>