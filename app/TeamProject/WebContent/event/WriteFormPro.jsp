<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="event.EventBoardDTO" %>
<%@ page import="event.EventBoardDAO" %>

<jsp:useBean id="dto" class="event.EventBoardDTO"/>
<%
	// 파일저장경로, 포맷사이즈, 한글파일 인코딩 처리
	String path = request.getRealPath("saveFolder");
	// String savePath = request.getRealPath("/Images/latterBoard");
	int maxSize = 1024*1024*50; // 50Mb
	String enc = "UTF-8";
	DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,maxSize,enc,drp);
	
	// 파일명 처리
	String on = mr.getOriginalFileName("file"); // 원본 파일명
	dto.setFileName(on);
	String sn = mr.getFilesystemName("file"); // 업로드된 파일명
	dto.setRealName(sn);
	dto.setFilePath("/TeamProject/saveFolder/"+on);
	
	// dto에 작성한 값을 겟 파라미터 하여 넣기..
	String id = (String)session.getAttribute("memId");
	dto.setWriter(id);
	dto.setRe_date(new Timestamp(System.currentTimeMillis()));
	dto.setSubject(mr.getParameter("subject"));
	dto.setContent(mr.getParameter("content"));
	dto.setSt_date(mr.getParameter("st_date:"));
	dto.setEnd_date(mr.getParameter("end_date"));
	dto.setSave(mr.getParameter("save"));

	
	EventBoardDAO dao = new EventBoardDAO();
	dao.insertArticle(dto);
	
%>

	<script>
		alert("작성되었습니다.");
		window.location="list.jsp";		
	</script>

	