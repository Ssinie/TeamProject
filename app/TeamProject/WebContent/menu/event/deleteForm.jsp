<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<center><h1><b>이벤트 게시글 삭제</b></h1></center>
<% request.setCharacterEncoding("UTF-8");%>

<%
  int num = Integer.parseInt(request.getParameter("num"));
  String pageNum = request.getParameter("pageNum");
%>


<form method="POST" name="delForm"  action="deletePro.jsp?pageNum=<%=pageNum%>" onsubmit="return deleteSave()"> 
	<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
		<tr height="30">
     		<td align=center><b>비밀번호를 입력해 주세요.</b></td>
  		</tr>
  		<tr height="30">
			<td align=center >
				비밀번호 : <input type="password" name="passwd" size="8" maxlength="12">
						 <input type="hidden" name="num" value="<%=num%>">
			</td>
		</tr>
 		<tr height="30">
    		<td align=center>
      			<input type="submit" value="글삭제" >
      			<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"> 
   			</td>
 		</tr>  
	</table> 
</form>
</body>

