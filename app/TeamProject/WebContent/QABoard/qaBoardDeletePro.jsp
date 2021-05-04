<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "QABoard.qaDAO" %>
<%@ page import = "QABoard.qaDTO" %>
<%@ page import = "java.sql.Timestamp" %>

<title> Q&A 자주 묻는 질문 삭제 처리 </title>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	qaDAO dao = new qaDAO();
	  int check = dao.deleteQABoard(num, passwd);

	  if(check==1){%>
		  <meta http-equiv="Refresh" content="0;url=csBoardList.jsp?pageNum=<%=pageNum%>" >
	<%}else{%>
	       <script language="JavaScript">         
	         alert("비밀번호가 맞지 않습니다");
	         history.go(-1);
	      </script>
	<%}%>
	<script>
		alert("삭제 되었습니다.");
		window.location="qaBoardList.jsp";
	</script>