<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  csDAO dao = new csDAO();
  int check = dao.passwdCheck(num, passwd); //passwdCheck DBBean을 호출한다.

  if(check==1){%>
	  <meta http-equiv="Refresh" content="0;url=csBoardContent.jsp?pageNum=<%=num%>&pageNum=<%=pageNum%>" >
<%}else{%>
       <script language="JavaScript">         
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
      </script>
<%}%>