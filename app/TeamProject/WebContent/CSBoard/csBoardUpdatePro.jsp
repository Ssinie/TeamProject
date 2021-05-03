<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>
<%@ page import = "java.sql.Timestamp" %>

<title> 글 수정 pro </title>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" scope="page" class="CSBoard.csDTO" />
<jsp:setProperty name="dto" property="*"/>

<%
 
    String pageNum = request.getParameter("pageNum");

	csDAO dao = new csDAO();
    int check = dao.updateCSBoard(dto);

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=csBoardList.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
      <script language="JavaScript">      
        alert("비밀번호가 맞지 않습니다");
        history.go(-1);
     </script>
<%}%>  
