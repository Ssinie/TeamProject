<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="CSBoard.csDAO" %>
<%@ page import="CSBoard.csDTO" %>

<title> 글 수정 pro </title>

<%
	String path = request.getRealPath("save");
	String enc = "UTF-8";
	int size = 1024*1024*10;
	DefaultFileRenamePolicy dp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,size,enc,dp);
	
	int num = Integer.parseInt(mr.getParameter("num"));
	String writer =  mr.getParameter("writer");
	String subject = mr.getParameter("subject");
	String content = mr.getParameter("content");
	String save = mr.getFilesystemName("save");
	
	csDTO dto = new csDTO();
	dto.setNum(num);
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	dto.setSave(save);
	
	csDAO dao = new csDAO();
	dao.insertcsBoard(dto);
%>
	<script>
		alert("수정되었습니다.")
		window.location="content.jsp?num=<%=num%>";
	</script>