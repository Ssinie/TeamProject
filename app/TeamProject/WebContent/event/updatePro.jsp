<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.EventBoardDAO" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>


<jsp:useBean id="dto" class="event.EventBoardDTO"/>
<%
request.setCharacterEncoding("UTF-8");

%>

<%
	// 파일저장경로, 포맷사이즈, 한글파일 인코딩 처리
	String path = "C:\\Users\\주사재\\Desktop\\주인선\\teamProject\\TeamProject\\app\\TeamProject\\WebContent\\Images\\event";
	// String savePath = request.getRealPath("/Images/latterBoard");
	int maxSize = 1024*1024*50; // 50Mb
	String enc = "UTF-8";
	DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy();
	MultipartRequest mr = new MultipartRequest(request,path,maxSize,enc,drp);
	
	// 파일명 처리
	String on = mr.getOriginalFileName("filePath"); // 원본 파일명
	dto.setFileName(on);
	String sn = mr.getFilesystemName("filePath"); // 업로드된 파일명
	dto.setRealName(sn);
	dto.setFilePath("/TeamProject/Images/event/"+on);
	
	String id = (String)session.getAttribute("memId");
	dto.setWriter(id);
	dto.setSubject(mr.getParameter("subject"));
	dto.setContent(mr.getParameter("content"));
	dto.setPasswd(mr.getParameter("passwd"));
	dto.setSt_date(mr.getParameter("st_date"));
	dto.setEnd_date(mr.getParameter("end_date"));
	
	EventBoardDAO dao = new EventBoardDAO();	
	dao.updateBoard(dto);
%>

<script>
	alert("수정되었습니다..")
	window.location="cardlist.jsp";
</script>
	
	
	
	