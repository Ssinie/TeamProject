<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<head>
<title>게시판</title>
</head>
<%
	// 로그인작업 끝나면 세션 연결
	// String id = (String)session.getAttribute("memId");
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	LatterBoardDAO dao = new LatterBoardDAO();
	LatterBoardDTO dto = dao.getArticle(num);
%>
<body>
<center><b>글 내용</b>
<br />
<table width="500" border="1" cellspacing="0" cellpadding="0" align="center">
	<tr height="30">
		<td align="center" width="125">글번호</td>
		<td align="center" width="125"><%=dto.getNum()%></td>
		<td align="center" width="125">조회수</td>
		<td align="center" width="125"><%=dto.getReadcount()%></td>
	</tr>
	<tr height="30">
		<td align="center" width="125">작성자</td>
		<td align="center" width="125"><%=dto.getEmail()%></td>
		<td align="center" width="125">작성일</td>
		<td align="center" width="200"><%=sdf.format(dto.getReg_date())%></td>
	</tr>
	<tr height="30">
		<td align="center" width="125">글제목</td>
		<td align="center" width="125" colspan="3"><%=dto.getSubject()%></td>
	</tr>
	<tr height="30">
		<td align="center" width="125">글내용</td>
		<td align="center" width="375" colspan="3"><%=dto.getContent()%></td>
	</tr>
	<tr height="30">
		<td colspan="4" align="center"><%
		
		// 로그인 여부로 글 쓰거나 수정하게...
		// if(id != null){%>
			<input type="button" value="글수정" onclick="" />
			<input type="button" value="글삭제" onclick="" />
			<input type="button" value="글목록" onclick="window.location='latterBoard.jsp?pageNum=<%=pageNum%>'" />
		<%// }%>
		</td>
</table>
</center>
</body>