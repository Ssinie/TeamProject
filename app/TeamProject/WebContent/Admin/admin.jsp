<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
%>
<title> Admin </title>

<body bgcolor="white">
<center>Admin 
<table width="800">
	
</table>

<table border="1" width="800" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd"> 
		<td align="center"  width="75"  >No.</td> 
		<td align="center"  width="450" >LIST</td> 
	    <td align="center"  width="100" >COUNT</td>
	    <td align="center"  width="175" >NEW</td> 
    </tr>
	<tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450"><a href="/TeamProject/latterBoard/typeList.jsp?menu=korean">후기게시판 - 한식</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450"><a href="/TeamProject/latterBoard/typeList.jsp?menu=japanese">후기게시판 - 일식</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450"><a href="/TeamProject/latterBoard/typeList.jsp?menu=western">후기게시판 - 양식</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450"><a href="/TeamProject/Reserve/Reserveinfo.jsp">예약게시판 - 예약확인</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450"><a href="/TeamProject/event/cardlist.jsp">이벤트 게시판 - 진행중</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450"><a href="/TeamProject/event/end.jsp">이벤트 게시판 - 종료</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >7</td>
    	<td align="center"  width="450"><a href="/TeamProject/CSBoard/csBoardList.jsp">1:1문의게시판 - 답글</a></td>
    	<td align="center"  width="100">ㄴㄴㄴㄴ</td>
    	<td align="center"  width="175">ㄱㄱㄱㄱ</td>
	</tr>
</table>
</br></br></br>
<input type="button" value="메뉴 바로가기" onclick="window.location='/TeamProject/menu/Korean.jsp'"/></br>
<input type="button" value="후기 바로가기" onclick="window.location='/TeamProject/latterBoard/imageList.jsp'"/></br>
<input type="button" value="예약 바로가기" onclick="window.location='/TeamProject/Reserve/ReserveForm.jsp'"/></br>
<input type="button" value="이벤트 바로가기" onclick="window.location='/TeamProject/event/cardlist.jsp'"/></br>
<input type="button" value="문의사항 바로가기" onclick="window.location='/TeamProject/CSBoard/csBoardList.jsp'"/></br>