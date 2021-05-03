<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "CSBoard.csDTO" %>
<%@ page import = "java.sql.Timestamp" %>

<% request.setCharacterEncoding("UTF-8");%>

<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	String passwd = request.getParameter("passwd");
	
	csDAO dao = new csDAO();
	  int check = dao.deleteCSBoard(num, passwd);

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
		window.location="csBoardList.jsp";
	</script>