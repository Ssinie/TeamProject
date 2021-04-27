<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "CSBoard.csDTO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
  String passwd = request.getParameter("password");

  csDAO dbPro = new csDAO();
  int check = dbPro.deleteArticle(num, passwd);

  if(check==1){%>
	  <meta http-equiv="Refresh" content="0;url=csBoard.jsp?pageNum=<%=pageNum%>" >
<%}else{%>
       <script language="JavaScript">         
         alert("비밀번호를 잘못 입력하셨습니다.");
         history.go(-1);
      </script>
<%}%>