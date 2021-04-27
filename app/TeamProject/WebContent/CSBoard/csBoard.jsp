<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "CSBoard.csDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<title> 고객센터 </title>

<%
    int pageSize = 10; // 한 페이지에 보여질 게시물 수.
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); //작성날짜를 해당 형식으로 나타냄. 91번 라인에서 사용.년-월-일 시:분 -> 년-월-일만 보여지게 할 수 있다.

    String pageNum = request.getParameter("pageNum"); //리스트에서 페이지 번호 클릭시 받을 수 있다. 100번 라인에서 확인. 자세히는 111번 라인.
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum); // 1
    int startRow = (currentPage - 1) * pageSize + 1; //(1-1) * 10 + 1 = 1
    int endRow = currentPage * pageSize; // 1 * 10 = 10
    int count = 0; // 전체 게시물 수.
    int number=0; // 화면 글 번호.

    List articleList = null;
    csDAO dbPro =new csDAO(); //DAO
    count = dbPro.getArticleCount(); //getArticleCount를 생성.
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow); // 위에 계산 되어있는 값이 들어간다.
    }

	number=count-(currentPage-1)*pageSize; // ex) 20 - ( 2 - 1 ) * 10 = 10.
			
	String id = (String)session.getAttribute("memId");
%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<<body bgcolor="white">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
	<tr>
    	<td align="right" bgcolor="white">
    	<%if(id != null){%>
    		<a href="writeForm.jsp">글쓰기</a>
    		<a href="myList.jsp">나의 작성글 목록</a>
    	<%}else{%>
    		<a href="/jsp/0416/loginForm.jsp">로그인 후 글 쓰기</a>
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
	<tr height="30" bgcolor="white">
		<td align="center"  width="50"  >번 호</td>
		<td align="center"  width="250" >제   목</td>
	    <td align="center"  width="100" >작성자</td>
	    <td align="center"  width="150" >작성일</td>
	    <td align="center"  width="50" >조 회</td>
	</tr>

<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	csDAO article = (csDAO)articleList.get(i);
%>
	<tr height="30">
    	<td align="center"  width="50" > <%=number--%></td>
    	<td  width="250" >

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
        if (endPage > pageCount) endPage = pageCount; //

        if (startPage > 10) {    %>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>
	<form action="searchList.jsp" method="post">
		<select name="col">
			<option value = "subject"> 제목</option>
			<option value = "writer"> 작성자 </option>
		</select>
		<input type="text" name="search" />
		<input type="submit" value="검색"/>
	</form>
</center>
</body>
</html>