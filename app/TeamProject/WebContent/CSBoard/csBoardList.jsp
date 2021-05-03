<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

	<title> 고객 1:1 문의 리스트</title>
<%
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List CSBoardList = null;
    csDAO dao =new csDAO();
    count = dao.getCSBoardCount();
    if (count > 0) {
        CSBoardList = dao.getCSBoard(startRow, endRow);
    }

	number=count-(currentPage-1)*pageSize;
	String id = (String)session.getAttribute("memId");
%>
<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="white">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
	<tr>
    	<td align="right" bgcolor="white">
    	<%if(id != null){%>
    		<a href="csBoardWrite.jsp">글쓰기</a>
    		<a href="csBoardMyList.jsp">나의 작성글 목록</a>
    	<%}else{%>
    		<a href="/TeamProject/Login/Login.jsp">로그인 후 글 쓰기</a>
    	<%} %>
    	</td>
    </tr>
</table>
<%if (count == 0) {%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>

<%  } else {    %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
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
    	<td align="center"  width="50" > <%=number--%></td>
    	<td  width="250" >
			<%int wid=0; 
		      if(dto.getRe_level()>0){
		      	wid=5*(dto.getRe_level()); %>
		  		<img src="images/level.gif" width="<%=wid%>" height="16">
		  		<img src="images/re.gif">
			<%}else{%>
		  		<img src="images/level.gif" width="<%=wid%>" height="16">
			<%}%>
     		 <a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
           		<%=dto.getSubject()%>
           	 </a> 
          <% if(dto.getReadcount()>=20){%>
         	<img src="images/hot.gif" border="0"  height="16">
           <%}%> 
		</td>
    	<td align="center"  width="100"> 
			<a href="mailto:<%=dto.getEmail()%>"><%=dto.getWriter()%></a>
		</td>
    	<td align="center"  width="150"><%= sdf.format(dto.getReg())%></td>
    	<td align="center"  width="50"><%=dto.getReadcount()%></td>
    	<td align="center" width="100" ><%=dto.getStatus()%></td>
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
</center>
</body>
</html>