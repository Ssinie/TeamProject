<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

	<title> 고객 1:1 문의 리스트</title>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("memId");
	
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }
    String adm = "";
	String stat = "";
    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List CSBoardList = null;
    csDAO dao =new csDAO();
    count = dao.getCSBoardCount(id);
    if (count > 0) {
        CSBoardList = dao.getCSBoard(id, startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="white">
<center><b> 나의 1 : 1 문의 목록 (전체 글:<%=count%>)</b>
<table width="900">
	<tr>
    	<td align="right" bgcolor="white">
    	<%if(id != null){%>
    		<a href="csBoardWrite.jsp">글쓰기</a>
    		<a href="csBoardList.jsp">전체 목록</a>
    	<%}else{%>
    		<a href="/TeamProject/Login/Login.jsp">로그인 후 글 쓰기</a>
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
<table border="1" width="900" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30" bgcolor="eeeeee"> 
		<td align="center"  width="50"  >번 호</td> 
		<td align="center"  width="250" >제   목</td> 
	    <td align="center"  width="100" >작성자</td>
	    <td align="center"  width="150" >작성일</td> 
	    <td align="center"  width="50" >조 회</td> 
	    <td align="center"  width="100" >상태</td>    
    </tr>
<%	for (int i = 0 ; i < CSBoardList.size() ; i++) {
    	csDTO dto = (csDTO)CSBoardList.get(i);
%>
	<tr height="30">
    	<td align="center"  width="75" > <%=number--%></td>
    	<td  width="350" >
     		 <a href="csBoardContent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
           		<%=dto.getSubject()%>
           	 </a>
		</td>
    	<td align="center"  width="100">
			<%if(dto.getWriter().equals("admin")) {%>
			<%=adm = "관리자"%>
			<%}else{%>
			<%=dto.getWriter()%>
			<%}%>
		</td>
    	<td align="center"  width="175"><%= sdf.format(dto.getReg())%></td>
    	<td align="center"  width="100"><%=dto.getReadcount()%></td>
    	<td align="center" width="100" >
    	<% if(dto.getStatus() == 1){stat = "처리중";}%>
    	<% if(dto.getStatus() == 2){stat = "답변완료";}%>
    	<% if(dto.getWriter().equals("admin")){stat = "";} %>
    	<%=stat%>
    	</td>
	</tr>
    <%}%>
</table>
<%}%>
<%
    if (count > 0) {
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) endPage = pageCount;
        
        if (startPage > 10) {    %>
        <a href="csBoardList.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="csBoardList.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="csBoardList.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>
	<form action="csBoardSearch.jsp" method="post">
		<select name="col">
			<option value = "subject"> 제목 </option>
			<option value = "writer"> 작성자 </option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색"/>
	</form>
</center>
</body>
</html>