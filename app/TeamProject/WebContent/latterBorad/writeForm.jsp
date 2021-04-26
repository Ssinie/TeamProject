<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int num=0,ref=1,re_step=0,re_level=0;

	if(request.getParameter("num")!=null){
	num=Integer.parseInt(request.getParameter("num"));
	ref=Integer.parseInt(request.getParameter("ref"));
}
%>    

<form action ="writeFormPro.jsp">
	<table border="1">
	
	<input type="hidden" name="num" value="<%=num%>">
	<input type="hidden" name="ref" value="<%=ref%>">
	<tr><td>
	<input type="text" name="subject" size="70" maxlength="100" />
	</td></tr>
	<tr><td>
	일식<input type="radio" value="menu" name="japanese" />
	중식<input type="radio" value="menu" name="chinies" />
	양식<input type="radio" value="menu" name="western" />
	</td></tr>
	<tr><td>
	<textarea name="content"  rows="30" cols="80"></textarea><br />
	</td></tr>
	<tr><td>
	<input type=submit value="완료" />
	</td></tr>
	</table>
</form>