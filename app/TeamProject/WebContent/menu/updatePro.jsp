<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%@ page import="menuboard.BoardDBBean" %>


<jsp:useBean class="menuboard.BoardDataBean" id="BoardDataBean" /> 

<%


String savePath = "D:\\자바\\team\\TeamProject\\app\\TeamProject\\WebContent\\menu\\img\\";
int maxSize = 1024*1024*10; // 10MB
String enc = "UTF-8";  //한글파일명 인코딩
DefaultFileRenamePolicy drp = new DefaultFileRenamePolicy(); //덮어씌우기 방지
MultipartRequest mr = new MultipartRequest(request,savePath,maxSize,enc,drp); //이 과정에서 업로드 됨.

int num = Integer.parseInt(mr.getParameter("num"));

BoardDataBean.setNum(num);

String subject = mr.getParameter("subject");
BoardDataBean.setSubject(subject);
String content = mr.getParameter("content");
BoardDataBean.setContent(content);
String on = mr.getOriginalFileName("file"); // 원본 파일명

BoardDataBean.setFileName(on);
String sn = mr.getFilesystemName("file"); // 업로드된 파일명

BoardDataBean.setFileRealName(sn);

	
BoardDataBean.setFileimage("/TeamProject/menu/img/"+on);
BoardDBBean file = new BoardDBBean();
file.upload2(BoardDataBean);	
%>
<script>
	alert("수정 완료");
	window.location="updateForm_list.jsp";
</script>
