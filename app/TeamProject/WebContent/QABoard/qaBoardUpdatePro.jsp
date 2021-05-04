<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="QABoard.qaDAO" %>
<%@ page import="QABoard.qaDTO" %>
<%@ page import = "java.sql.Timestamp" %>

<title> Q&A 자주 묻는 질문 수정 처리 </title>

<% request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id="dto" scope="page" class="QABoard.qaDTO" />
<jsp:setProperty name="dto" property="*"/>

<%
 
    String pageNum = request.getParameter("pageNum");

	qaDAO dao = new qaDAO();
    int check = dao.updateQABoard(dto);

    if(check==1){
%>
	  <meta http-equiv="Refresh" content="0;url=csBoardList.jsp?pageNum=<%=pageNum%>" >
<% }else{%>
      <script language="JavaScript">      
        alert("비밀번호가 맞지 않습니다");
        history.go(-1);
     </script>
<%}%>