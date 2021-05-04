<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "latterboard.LBCommDAO" %>
<%@ page import = "latterboard.LBCommDTO" %>
<%@ page import = "java.util.List" %>
<head>
<title>게시판</title>
</head>
<%
	
	// 로그인작업 끝나면 세션 연결
	// String id = (String)session.getAttribute("memId");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	SimpleDateFormat sdfs = new SimpleDateFormat("yy-MM-dd HH:mm");
	
	LatterBoardDAO dao = new LatterBoardDAO();
	LatterBoardDTO dto = dao.getArticle(num);


	LBCommDAO lbcmdao = new LBCommDAO();
	List commlist = lbcmdao.getArticle(num);
%>
<body>
<center>
<form action ="writeFormPro.jsp">
	<table border="1">
	
	<input type="hidden" name="num" value="<%=num%>">
	<tr><td>
	<p style="text-align:center;"><b>글쓰기</b></p>
	</td></tr>
	<tr><td>
	<br />
	제목 : <input type="text" name="subject" size="70" maxlength="100" value="<%=dto.getSubject()%>"/><br />
	
	</td></tr>
	<tr><td>
	<br />
	일식<input type="radio" name="menu" value="japanese" th:value="japanese" checked />
	중식<input type="radio" name="menu" value="chinies" th:value="chinies" checked />
	양식<input type="radio" name="menu" value="western" th:value="western" checked />
	<br />
	</td></tr>
	<tr><td>
	<br />
	내용 <br />
	<textarea name="content"  rows="30" cols="80" ><%=dto.getSubject()%></textarea><br />
	</td></tr>
	<tr><td>
	<input type=submit value="완료" align="center" />
	</td></tr>
	</table>
</form>
</center>
</body>