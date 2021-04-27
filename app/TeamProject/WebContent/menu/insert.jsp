<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ page import="com.oreilly.servlet.MultipartRequest" %><!-- 실제로 파일 업로드 하기 위한 클래스 -->
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %><!-- 파일 이름이 동일한게 나오면 자동으로 다른걸로 바꿔주고 그런 행동 해주는것 -->
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.io.File" %>
<%@ page import="test.board.fileDAO" %>

<jsp:useBean class="test.board.fileDTO" id="filedto" /> 
	<jsp:setProperty name="filedto" property="*" />
<%

	String savePath = "d:\\save\\";	
	int maxSize = 1024*1024*10; // 10MB
	String enc = "UTF-8";  //한글파일명 인코딩
	DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy(); //덮어씌우기 방지
	MultipartRequest mr = new MultipartRequest(request,savePath,maxSize,enc,drp); //이 과정에서 업로드 됨.

	
	String writer = mr.getParameter("writer");
	
	String on = mr.getOriginalFileName("file"); // 원본 파일명
	String sn=mr.getFilesystemName("file"); // 업로드된 파일명
	
	
	fileDAO file = new fileDAO();
	file.upload(filedto);
	
		
%>


