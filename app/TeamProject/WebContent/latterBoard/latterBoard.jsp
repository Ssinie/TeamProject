<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List articleList = null;
	LatterBoardDAO dao = new LatterBoardDAO();
	count = dao.getArticleCount();
	out.println(count);
	if(count > 0){
		articleList = dao.getArticles(startRow, endRow);
	}
	number = count-(currentPage-1)*pageSize;
	String id = (String)session.getAttribute("memId");
%>
<html>
<head>
<title>후기 게시판</title>
</head>
<body>
<center><b>글목록(전체 글 : <%=count%>)</b>
<table width="700">
	<tr>
		<td align = "right">
		<a href="writeForm.jsp" >글쓰기</a>
		</td>
	</tr>
</table>

<%if(count == 0){%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
			<td align="center">
				게시판에 저장된 글이 없습니다.
			</td>
		</tr>
	</table>

	<%}
else{%>
<table width="700" border="1" cellpadding="0" cellspacing="0" align="center">
	<tr height="30">
		<td align="center" width="50">번호</td>
		<td align="center" width="50">작성자</td>
		<td align="center" width="50">제목</td>
		<td align="center" width="50">작성일</td>
		<td align="center" width="50">조회</td>
		<td align="center" width="50">IP</td>
	</tr><%
	for(int i = 0; i <articleList.size(); i++){
		LatterBoardDTO dto = (LatterBoardDTO)articleList.get(i);
%>
	<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td align="center" width="70"><%=dto.getWriter()%></td>
		<td>
		<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
           		<%=dto.getSubject()%></a></td> 
		<td align="center" width="150"><%=sdf.format(dto.getReg_date()) %></td>
		<td align="center" width="50"><%=dto.getReadcount()%></td>
		<td align="center" width="100"><%=dto.getIp() %></td>
	</tr>
	<%}%>
</table>
<%}

if(count > 0){
	
	int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1 );
	
	int startPage = (int)(currentPage/10)*10+1;
	int pageBlock = 10;
					 
	int endPage = startPage + pageBlock -1;
	if(endPage > pageCount) endPage = pageCount;
	
	if(startPage > 10){%>
		<a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
	<%}
	for(int i = startPage; i <= endPage; i++){%>
		<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	<%}
	if(endPage < pageCount){%>
		<a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%}
}%>
<form action="searchList.jsp" method="post">
	<select name="col">
		<option value = "subject">제목</option>
		<option value = "subject">작성자</option>
	</select>
	<input type="text" name="search" />
	<input type="submit" value="검색" />
</form>
</center>
</body>
</html>