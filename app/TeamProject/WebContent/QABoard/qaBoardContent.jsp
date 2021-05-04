<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="QABoard.qaDTO" %>
<%@ page import="QABoard.qaDAO" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<title> 자주 묻는 질문 내용 </title>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
   
	qaDAO dao = new qaDAO();
	qaDTO dto =  dao.getQABoard(num);
  
	int ref=dto.getRef();
	int re_step=dto.getRe_step();
	int re_level=dto.getRe_level();
%>

<body bgcolor="white">
<br>
<table width="500" border="1" cellspacing="0" cellpadding="0"  bgcolor="white" align="center">  
	<tr height="30">
		<td align="center" width="125" bgcolor="white">글번호</td>
		<td align="center" width="125" align="center"><%=dto.getNum()%></td>
	    <td align="center" width="125" bgcolor="white">조회수</td>
	    <td align="center" width="125" align="center"><%=dto.getReadcount()%></td>
  </tr>
  <tr height="30">
	    <td align="center" width="125" bgcolor="white">작성자</td>
	    <td align="center" width="125" align="center"><%=dto.getWriter()%></td>
	    <td align="center" width="125" bgcolor="white" >작성일</td>
	    <td align="center" width="125" align="center"><%= sdf.format(dto.getReg())%></td>
  </tr>
  <tr height="30">
		<td align="center" width="125" bgcolor="white">글제목</td>
		<td align="center" width="375" align="center" colspan="3"><%=dto.getSubject()%></td>
  </tr>
  <tr>
	    <td align="center" width="125" bgcolor="white">글내용</td>
	    <td align="left" width="375" colspan="3"><pre><%=dto.getContent()%></pre></td>
  </tr>
  <tr height="30">      
	    <td colspan="4" bgcolor="white" align="right" > 
	    
			<%
				String id = (String)session.getAttribute("memId");
				if(id != null){
					if(id.equals(dto.getWriter())){%>
						<input type="button" value="글수정" onclick="window.location='qaBoardUpdate.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
						<input type="button" value="글삭제" onclick="window.location='qaBoardDelete.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>'">
					<%}%>
					<input type="button" value="답글쓰기" onclick="window.location='qaBoardWrite.jsp?num=<%=num%>&ref=<%=ref%>&re_step=<%=re_step%>&re_level=<%=re_level%>'">
			   <%}%>
			<input type="button" value="글목록" onclick="window.location='qaBoardList.jsp?pageNum=<%=pageNum%>'">
	    </td>
  </tr>
</table>
</body>
</html>