<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "QABoard.qaDAO" %>
<%@ page import = "QABoard.qaDTO" %>
<%@ page import = "java.util.List" %>

<div id="menubar">
	<div><a href="/TeamProject/CSBoard/csBoardList.jsp"> 1:1 문의 게시판 </a></div>
	<div><a href="qaBoardList.jsp"> 자주 묻는 질문 </a></div><br />
</div>

<%
	request.setCharacterEncoding("UTF-8");

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
	qaDTO dto = null;
%>
<html>
<head>
<title> 게시판 </title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="white">
<center><b> Q&A 자주묻는질문 </b>
<table width="800">
	<tr>
    	<td align="right" bgcolor="white">
    	<%if(id == null){%>
    		<a href="/TeamProject/Login/Login.jsp">로그인</a>
    	<%} %>
    	<%if(id != null && id.equals("admin")){%>
    		<a href="qaBoardWrite.jsp">글쓰기</a>
    	<%} %>
    	</td>
    </tr>
  </table>
</html>

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
<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">


<% for(int iu = 0; iu < QABoardList.size(); iu++){
		dto = (qaDTO)QABoardList.get(iu);
%>
<div class="panel panel-default">
<div class="panel-heading" role="tab">
<a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse<%=iu %>" aria-expanded="false">
<%= dto.getSubject() %>
</a>
</div>
<div id="collapse<%=iu %>" class="panel-collapse collapse" role="tabpanel">
<div class="panel-body">
<%= dto.getContent() %> </br>
<%if(id != null && id.equals("admin")){%>
	<a href="qaBoardContent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">글 수정 및 삭제하기</a>
<%} %>
</div>
</div>
</div>
<%}%>
<%if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        if (startPage > 10) {    %>
        	<a href="qaBoardList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a><%}
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="qaBoardList.jsp?pageNum=<%= i %>">[<%= i %>]</a><%}
        if (endPage < pageCount) {  %>
        	<a href="qaBoardList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a><%}
}%>
	<form action="qaBoardSearch.jsp" method="post">
		<select name="col">
			<option value = "subject"> 제목 </option>
			<option value = "content"> 내용 </option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색"/>
	</form>
</center>
</div>
</div>
</body>
</html>