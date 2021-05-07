<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
	if(id == null){
%>		
		<script>
			alert("★로그인 후 글쓰기 가능합니다!!!★");
			window.location='/TeamProject/Login/Login.jsp';
		</script>
<%} %>    

<% 
  int num=0;
 
    if(request.getParameter("num")!=null){
		num=Integer.parseInt(request.getParameter("num"));
	}
%>
   
<body>
<center><h1><b>이벤트 게시판 글쓰기</b></h1></center>
<br>
<form method="post" name="Writeform" action="WriteFormPro.jsp" onsubmit="return writeSave()">
<input type="hidden" name="num" value="<%=num%>"> <!-- 글번호 -->

<table width="870" border="1" cellspacing="0" cellpadding="0"  align="center">
   <tr>
    <td  width="200" align="center">제목</td>
    <td  width="330">
       <input type="text" name="subject" required autofocus>
    </td>
  </tr>
  <tr>
    <td  width="200" align="center" >작성자</td>
    <td  width="330"><%=id %>
    <input type="hidden" name="writer" value="<%=id %>"></td>
  </tr>
  <tr>
    <td  width="200" align="center" >내 용</td>
    <td  width="330" >
     <textarea name="content" rows="13" cols="40"></textarea> </td>
  </tr>
    <tr>
    <td  width="200" align="center" >첨부파일</td>
    <td  width="330" >
     <input type="file" name="file"></td>
  </tr>
   <tr>
    <td  width="200" align="center" >이벤트 시작일</td>
    <td  width="330" >
     <input type="date" name="st_date" required> 
	 </td>
  </tr>
   <tr>
    <td  width="200" align="center" >이벤트 종료일</td>
    <td  width="330" >
     <input type="date" name="end_date" required> 
	 </td>
  </tr> 
  <tr>
    <td  width="200" align="center" >비밀번호</td>
    <td  width="330" >
     <input type="password" size="21" maxlength="12" name="passwd" required> 
	 </td>
  </tr>
  
 <tr>      
 <td colspan=6 align="center"> 
  <input type="submit" value="글쓰기" > 
  <input type="reset" value="다시작성">
  <input type="button" value="목록보기" OnClick="window.location='list.jsp'">
</td></tr></table>    


   
</form>      
</body>
</html>      