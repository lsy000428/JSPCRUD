<%@page import="javax.swing.text.View"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="bbs.BbsBean"%>
<%@ page import="bbs.BbsDao"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="<%= (String)session.getAttribute(\"test\") %>"/>
<%
request.setCharacterEncoding("UTF-8");
%>
<fmt:requestEncoding value="UTF-8" />
<fmt:bundle basename="message">
	<p>
		<fmt:message key="NUM" var="num" />
		<fmt:message key="TITLE" var="title" />
		<fmt:message key="WRITER" var="writer" />
		<fmt:message key="DATE" var="date" />
		<fmt:message key="WRITE" var="write" />
		<fmt:message key="PREV" var="prev" />
		<fmt:message key="NEXT" var="next" />
		<fmt:message key="LOGOUT" var="logout" />
	<p>
</fmt:bundle>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width" , initial-scale="1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
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
	int pageNumber = 1; //기본은 1페이지 할당
	//만약 파라미터로 넘어온 오브젝트 타입 'pagenumber' 가 존재한다면
	//'int' 타입으로 캐스팅을해주고 그 값을 pagenumber에 저장한다
	if (request.getParameter("pageNumber") != null) {
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	%>
	<div class="container">
		<div class="row">
		<input type="button" value="한국어" class="btn btn-primary" onclick="changeLanguage('ko')"></input>
    <input type="button" value="ENGLISH" class="btn btn-primary" onclick="changeLanguage('en')"></input>
	
			<table class="custom-table" style="text-align: center; border: 1px solid #cccccc">
				<thead>
					<tr>
						<th style="background-color: #eeeeee;" text-align :center;">${num }</th>
						<th style="background-color: #eeeeee;" text-align :center;">${title }</th>
						<th style="background-color: #eeeeee;" text-align :center;">${writer }</th>
						<th style="background-color: #eeeeee;" text-align :center;">${date }</th>

					</tr>
				</thead>
				<tbody>
					<%
					BbsDao bd = new BbsDao(); //인스턴스 생성
					ArrayList<BbsBean> list = bd.getList(pageNumber);
					for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><%=list.get(i).getBbsID()%></td>
						<td><a href="View.do?bbsID=<%=list.get(i).getBbsID()%>">
								<%=list.get(i).getBbsTitle()%></a></td>
						<td><%=list.get(i).getUserID()%></td>
						<td><%=list.get(i).getBbsDate()%></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<!-- 페이징 처리 영역 -->
			<%
			if (pageNumber != 1) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>"
				class="btn btn-success btn-arraw-left">${prev }</a>
			<%
			}
			if (bd.nextPage(pageNumber + 1)) {
			%>
			<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>"
				class="btn btn-success btn-arraw-right">${next }</a>
			<%
			}
			%>


			<!-- 글쓰기버튼 생성 -->
			<a href="write.do" class="btn btn-primary pull-right">${write }</a>
			<a href="LoginForm.do" class="btn btn-primary">${logout }</a>
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
</body>
</html>