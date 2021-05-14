<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
	int num=0,ref=1,re_step=0,re_level=0;

	if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	ref=Integer.parseInt(request.getParameter("ref"));
}
%>    
<body>
<center>
<form name="inform" action ="writeFormPro.jsp" method="post" enctype="multipart/form-data" >
	<table border="1">
	
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<tr><td>
	<p style="text-align:center;"><b>글쓰기</b></p>
	</td></tr>
	<tr><td>
	<br />
	제목 : <input type="text" name="subject" size="70" maxlength="100" /><br />
	
	</td></tr>
	<tr>
		<td>
		<br />
		일식<input type="radio" name="menu" value="japanese" checked />
		중식<input type="radio" name="menu" value="chinies" />
		양식<input type="radio" name="menu" value="western" />
		<br />
		</td>
	</tr>
	<tr>
		<td>
		<br />내용 <br />
		<textarea name="content"  rows="30" cols="80"></textarea><br />
		</td>
	</tr>
	<tr>
		<td>
		<input type="file" name="file" />
		</td>
	</tr>
	<tr>
	<td>
	<br />비밀번호<br />
	<input type="password" size="21" maxlength="12" name="passwd" required>
	</tr>
	<tr><td>
	<input type=submit value="완료" />
	</td></tr>
	</table>
</form>
<%
	
%>
</center>
</body>