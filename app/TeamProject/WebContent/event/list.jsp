<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.EventBoardDAO" %>
<%@ page import="event.EventBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<%
	String id = (String)session.getAttribute("memId");
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List articleList = null;
    EventBoardDAO dao =new EventBoardDAO();
    count = dao.getArticleCount();
    if (count > 0) {
    	articleList = dao.getArticles(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
%>
<html>
<head>
<title>이벤트 게시판 list</title>
</head>

<body bgcolor="white">
<center><b><h1> 이벤트 게시판 목록 (전체 글:<%=count%>)</h1></b>
<table width="1200">
	<tr>
    	<td align="right">
    	<%if(id != null && id.equals("admin")){%>
    		<a href="WriteForm.jsp">글쓰기</a>
    		<a href="/TeamProject/lobby/lobby.jsp">HOME</a>
    	<%}else{%>
    		<b><em>이벤트 게시글은 관리자만 작성 가능합니다.</em></b>
			<a href="/TeamProject/lobby/lobby.jsp">HOME</a>
    	<%} %>
    	</td>
    </tr>
</table>
<%if (count == 0) {%>
	<table width="900" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>

<%  } else {    %>
<table border="1" width="1200" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30"> 
		<td align="center"  width="50"  >번 호</td> 
		<td align="center"  width="250" >제 목</td> 
	    <td align="center"  width="100" >작성자</td>
	    <td align="center"  width="150" >날 짜</td> 
	    <td align="center"  width="50" >조 회</td>
	    <td align="center"  width="150" >이벤트 시작일</td> 
	    <td align="center"  width="150" >이벤트 종료일</td>    	       	        
    </tr>
<%	for (int i = 0 ; i < articleList.size() ; i++) {
	EventBoardDTO dto = (EventBoardDTO)articleList.get(i);
%>
<tr height="30">
		<td align="center" width="50"><%=number--%></td>
		<td align="center" width="250">
		<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
           		<%=dto.getSubject()%></a></td> 
		<td align="center" width="100"><%=dto.getWriter()%></td>
		<%if(dto.getRe_date() != null){%>
      		<td align="center" width="150"><%=sdf.format(dto.getRe_date()) %></td>   
      	<%}else{%>
      		<td align="center" width="150"><%=dto.getRe_date() %></td>
      <%}%>
		<td align="center" width="50"><%=dto.getReadcount()%></td>
		<td align="center" width="150"><%=dto.getSt_date()%></td>
		<td align="center" width="150"><%=dto.getEnd_date() %></td>

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

</center>
</body>
</html>