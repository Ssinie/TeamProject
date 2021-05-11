<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "QABoard.qaDAO" %>
<%@ page import = "QABoard.qaDTO" %>
<%@ page import = "java.util.List" %>

<%
	String id = (String)session.getAttribute("memId");
	int pageSize = 10;
	String pageNum = request.getParameter("pageNum");
	if (pageNum == null) {
	    pageNum = "1";
	}
	
	String adm = "";
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number=0;
	
	List QABoardList = null;
	qaDAO dao =new qaDAO();
	count = dao.getQABoardCount();
	if (count > 0) {
	    QABoardList = dao.getQABoard(startRow, endRow);
	}
	number=count-(currentPage-1)*pageSize;
%>
<html>
<head>
<title> 게시판 </title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="white">
<center><b> Q&A 자주묻는질문 </b>
<table width="800">
<html>
<head>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid" style="min-height: calc(100vh - 136px);">
<!-- 그룹 태그로 role과 aria-multiselectable를 설정한다. -->
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
<!-- 하나의 item입니다. data-parent 설청과 href 설정만 제대로 하면 문제없이 작동합니다. -->
<div class="panel panel-default">
<div class="panel-heading" role="tab">
<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse1" aria-expanded="false">
공지 사항
</a>
</div>
<div id="collapse1" class="panel-collapse collapse" role="tabpanel">
<div class="panel-body">
이거 어떻게 해야 합니까!!!!
</div>
</div>
</div>

<div class="panel panel-default">
<div class="panel-heading" role="tab">
<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse2" aria-expanded="false">
안내 사항
</a>
</div>
<div id="collapse2" class="panel-collapse collapse" role="tabpanel">
<div class="panel-body">
안내를 도와드릴 수 없네요
</div>
</div>
</div>
<div class="panel panel-default">
<div class="panel-heading" role="tab">
<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse3" aria-expanded="false">
오시는 방법
</a>
</div>
<div id="collapse3" class="panel-collapse collapse" role="tabpanel">
<div class="panel-body">
날아서 오세요
</div>
</div>
</div>
</div>
</div>
</body>
</html>
<%if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        if (startPage > 10) {    %>
        <a href="qaBoardSample.jsp?pageNum=<%= startPage - 10 %>">[이전]</a><%}
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="qaBoardSample.jsp?pageNum=<%= i %>">[<%= i %>]</a><%}
        if (endPage < pageCount) {  %>
        	<a href="qaBoardSample.jsp?pageNum=<%= startPage + 10 %>">[다음]</a><%}
}%>
	<form action="qaBoardSample.jsp" method="post">
		<select name="col">
			<option value = "subject"> 제목 </option>
			<option value = "content"> 내용 </option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색"/>
	</form>
</center>
</body>
</html>