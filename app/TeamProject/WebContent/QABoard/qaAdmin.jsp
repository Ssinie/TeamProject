<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "QABoard.qaDAO" %>
<%@ page import = "QABoard.qaDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<title> Q&A 자주 묻는 질문 관리자 </title>

<%
	String id = (String)session.getAttribute("memId");
	
	int pageSize = 10;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
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
<title> Q&A 자주 묻는 질문 관리자 </title>
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
    	<%if(id != null){%>
    		<a href="/TeamProject/CSBoard/csBoardList.jsp">1 : 1 문의 게시판 가기</a>
    	<%} %>
    	<%if(id != null && id.equals("admin")){%>
    		<a href="qaBoardWrite.jsp">글쓰기</a>
    	<%} %>
    	</td>
    </tr>
</table>
<%if (count == 0) {%>
	<table width="800" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>
<%} else {%>
<table border="1" width="800" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="eeeeee"> 
		<td align="center"  width="75"  >No.</td>
		<td align="center"  width="450" >제 목</td>
	    <td align="center"  width="100" >작성자</td>
	    <td align="center"  width="175" >작성일</td>
    </tr>
<%	for (int i = 0 ; i < QABoardList.size() ; i++) {
    	qaDTO dto = (qaDTO)QABoardList.get(i);
%>
	<tr height="30">
    	<td align="center"  width="75" > <%=number--%></td>
    	<td  width="450" >
			<a onclick="this.nextSibling.style.display=(this.nextSibling.style.display=='none')?'block':'none';" href="javascript:void(0)">
           		<h2><%=dto.getSubject()%></h2>
				</a><div style="DISPLAY: none">
           		<h3><%=dto.getContent()%></h3>
				</div>
					<%if(id != null && id.equals("admin")){%>
	    			<a href="qaBoardContent.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">글 수정 및 삭제하기</a>
    				<%} %></a>
		</td>
    	<td align="center"  width="100">
			<%if(dto.getWriter().equals("admin")) { adm = "관리자"; }%>
			<%=adm%>
		</td>
    		<td align="center"  width="175"><%= sdf.format(dto.getReg())%></td>
	</tr>
    <%}%>
</table>
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
</body>
</html>