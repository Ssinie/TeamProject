<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "CSBoard.csDTO" %>
<%@ page import = "Reserve.ReserveDAO" %>
<%@ page import = "Reserve.ReserveDTO" %>
<%@ page import = "java.util.List" %>

<%
	String id = (String)session.getAttribute("memId");
	
	int rescount = 0;
	ReserveDAO resdao = new ReserveDAO();
	
	int cscount = 0;
	csDAO csdao = new csDAO();
	cscount = csdao.getCSBoardCount();
%>

<title> Admin </title>

<body bgcolor="white">
<center><h3>관리자 전용 페이지</h3>
<table width="800">
</table>

<table border="1" width="1050" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd"> 
		<td align="center"  width="75"  >No.</td> 
		<td align="center"  width="450" >LIST</td> 
	    <td align="center"  width="175" >COUNT-DAY</td>
	    <td align="center"  width="175" >COUNT-WEEK</td> 
	    <td align="center"  width="175" >COUNT-MONTH</td>
    </tr>
	<tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">예약 건 수</td>
    	<td align="center"  width="175"><%=rescount%></td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">후기게시판 총 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">후기게시판 한식 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">후기게시판 일식 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">후기게시판 양식 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">문의게시판 총 건 수</td>
    	<td align="center"  width="175"><%=cscount%></td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >7</td>
    	<td align="center"  width="450">문의 게시판 미 답변 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >8</td>
    	<td align="center"  width="450">문의 게시판 답변 완료 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >9</td>
    	<td align="center"  width="450">이벤트 게시판 진행중 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >10</td>
    	<td align="center"  width="450">이벤트 게시판 종료된 건 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >11</td>
    	<td align="center"  width="450">회원 수</td>
    	<td align="center"  width="175">일일 카운트 코드</td>
    	<td align="center"  width="175">주간 카운트 코드</td>
    	<td align="center"  width="175">월간 카운트 코드</td>
	</tr>
</table>
</br></br></br>
<table border="1" width="875" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd">
		<td align="center"  width="75"  >No.</td> 
		<td align="center"  width="450" >게시판 이름</td> 
	    <td align="center"  width="175" >글쓰기 바로가기</td>
	    <td align="center"  width="175" >게시판 바로가기</td> 
    </tr>
    <tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">메뉴 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/menu/WriteForm.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/menu/menupage.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">이벤트 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/event/WriteForm.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/event/cardlist.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">후기 게시판</td>
    	<td align="center"  width="175"></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/latterBoard/imageList.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">1 : 1 문의 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/CSBoard/csBoardWrite.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/CSBoard/csBoardList.jsp'"/></td>
	</tr>
    <tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">자주 묻는 질문 게시판</td>
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/QABoard/qaBoardWrite.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/QABoard/qaBoardList.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">예약 게시판</td>
    	<td align="center"  width="175"></td>
    	<td align="center"  width="175"><input type="button" value="바로가기" onclick="window.location='/TeamProject/Reserve/ReserveForm.jsp'"/></td>
	</tr>
</table>