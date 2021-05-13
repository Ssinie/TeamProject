<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "latterboard.LatterBoardDAO" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("passwd");

  LatterBoardDAO dao = new LatterBoardDAO();
  int check = dao.deleteBoard(num, passwd);

  if(check==1){%>
	  <meta http-equiv="Refresh" content="0;url=list.jsp?pageNum=<%=pageNum%>" >
	   <script language="JavaScript">         
         alert("삭제되었습니다.");
         window.location="imageList.jsp";
      </script>
<%}else{%>
       <script language="JavaScript">         
         alert("비밀번호가 맞지 않습니다");
         history.go(-1);
      </script>
<%}%>