<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import = "Reserve.ReserveDAO" %>
<%@ page import = "Reserve.ReserveDTO" %>
<%@ page import = "event.EventBoardDAO" %>
<%@ page import = "event.EventBoardDTO" %>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "CSBoard.csDAO" %>
<%@ page import = "CSBoard.csDTO" %>
<%@ page import = "Login.MemberDAO" %>
<%@ page import = "Login.MemberDTO" %>
<%@ page import = "java.util.List" %>

<%
	String id = (String)session.getAttribute("memId");
	//예약
	int rescount = 0;
	ReserveDAO resdao = new ReserveDAO();
	ReserveDTO resdto = new ReserveDTO();
	//후기
	int latcount = 0; // 총 후기 글 카운트
	int kfcount = 0; // 한식 후기 글 카운트
	int jfcount = 0; // 일식 후기 글 카운트
	int wfcount = 0; // 양식 후기 글 카운트
	int kfdcount = 0; // 일일 한식 후기 글 카운트
	int kfwcount = 0; // 주간 한식 후기 글 카운트
	int kfmcount = 0; // 월간 한식 후기 글 카운트
	int jfdcount = 0; // 일일 일식 후기 글 카운트
	int jfwcount = 0; // 주간 일식 후기 글 카운트
	int jfmcount = 0; // 월간 일식 후기 글 카운트
	int wfdcount = 0; // 일일 양식 후기 글 카운트
	int wfwcount = 0; // 주간 양식 후기 글 카운트
	int wfmcount = 0; // 월간 양식 후기 글 카운트
	LatterBoardDAO latdao = new LatterBoardDAO();
	LatterBoardDTO latdto = new LatterBoardDTO();
	kfcount = latdao.getLatterKoreanCount(kfcount);
	jfcount = latdao.getLatterjapaneseCount(jfcount);
	wfcount = latdao.getLatterWesternCount(wfcount);
	latcount = kfcount + jfcount + wfcount;
	kfdcount = latdao.getLatterKoreanDayCount(kfdcount);
	kfwcount = latdao.getLatterKoreanWeekCount(kfwcount);
	kfmcount = latdao.getLatterKoreanMonthCount(kfmcount);
	jfdcount = latdao.getLatterJapaneseDayCount(jfdcount);
	jfwcount = latdao.getLatterJapaneseWeekCount(jfwcount);
	jfmcount = latdao.getLatterJapaneseMonthCount(jfmcount);
	wfdcount = latdao.getLatterWesternDayCount(wfdcount);
	wfwcount = latdao.getLatterWesternWeekCount(wfwcount);
	wfmcount = latdao.getLatterWesternMonthCount(wfmcount);
	
	//이벤트
	int evcount = 0; // 총 이벤트 카운트
	int evicount = 0; // 진행중 이벤트 카운트
	int evecount = 0; // 종료된 이벤트 카운트
	int evdcount = 0; // 일일 등록 진행중 이벤트 카운트
	int evwcount = 0; // 주간 등록 진행중 이벤트 카운트
	int evmcount = 0; // 월간 등록 진행중 이벤트 카운트
	int evedcount = 0; // 일일 종료된 이벤트 카운트
	int evewcount = 0; // 주간 종료된 이벤트 카운트
	int evemcount = 0; // 월간 종료된 이벤트 카운트
	EventBoardDAO evedao = new EventBoardDAO();
	EventBoardDTO evedto = new EventBoardDTO();
	evicount = evedao.getEventCount(evicount);
	//evecount = evedao.getEndEventCount(evecount);
	evcount = evicount + evecount;
	evdcount = evedao.getEventDayCount(evdcount);
	evwcount = evedao.getEventWeekCount(evwcount);
	evmcount = evedao.getEventMonthCount(evmcount);
	
	
	
	//CS
	int cscount = 0; // 총 문의 글 카운트
	int csstcount = 1; // 미답변 문의 글 카운트
	int regcount = 1; // 일일 미답변 문의 글 카운트
	int wecount = 1; // 주간 미답변 문의 글 카운트
	int moncount = 1; //월간 미답변 문의 글 카운트
	int csstacount = 2; // 답변완료 문의 글 카운트
	int regscount = 2; // 일일 답변완료 문의 글 카운트
	int weecount = 2; // 주간 답변완료 문의 글 카운트
	int montcount = 2; //월간 답변완료 문의 글 카운트
	csDAO csdao = new csDAO();
	csDTO csdto = new csDTO();
	csstcount = csdao.getCSBoardStatusCount(csstcount);
	csstacount = csdao.getCSBoardStatusCount(csstacount);
	cscount = csstcount + csstacount;
	regcount = csdao.getCSBoardDayCount(regcount);
	regscount = csdao.getCSBoardDayCount(regscount);
	wecount = csdao.getCSBoardWeekCount(wecount);
	weecount = csdao.getCSBoardWeekCount(weecount);
	moncount = csdao.getCSBoardMonthCount(moncount);
	montcount = csdao.getCSBoardMonthCount(montcount);
	
	//회원
	int memcount = 0; //총 회원 카운트
	int dmemcount = 0; // 일일 신규회원 카운트
	int wmemcount = 0; // 주간 신규회원 카운트
	int mmemcount = 0; // 월간 신규회원 카운트
	MemberDAO memdao = new MemberDAO();
	MemberDTO memdto = new MemberDTO();
	memcount = memdao.getMemberCount(memcount);
	dmemcount = memdao.getMemberDayCount(dmemcount);
	wmemcount = memdao.getMemberWeekCount(wmemcount);
	mmemcount = memdao.getMemberMonthCount(mmemcount);
%>

<title> Admin </title>

<body bgcolor="white">
<center><h3>관리자 전용 페이지</h3>
<table width="800">
</table>

<table border="1" width="1200" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd">
		<td align="center"  width="75"  >No.</td>
		<td align="center"  width="450" >LIST</td>
	    <td align="center"  width="175" >COUNT-DAY</td>
	    <td align="center"  width="175" >COUNT-WEEK</td>
	    <td align="center"  width="175" >COUNT-MONTH</td>
	    <td align="center"  width="175" >TOTAL</td>
    </tr>
    	<tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">예약 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=rescount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">예약 건 수</td>
    	<td align="center"  width="175">일별 예약 코드</td>
    	<td align="center"  width="175">주간 예약 코드</td>
    	<td align="center"  width="175">월간 예약 코드</td>
    	<td align="center"  width="175">TOTAL</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">후기게시판 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=latcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">후기게시판 한식 건 수</td>
    	<td align="center"  width="175"><%=kfdcount%></td>
    	<td align="center"  width="175"><%=kfwcount%></td>
    	<td align="center"  width="175"><%=kfmcount%></td>
    	<td align="center"  width="175"><%=kfcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">후기게시판 일식 건 수</td>
    	<td align="center"  width="175"><%=jfdcount%></td>
    	<td align="center"  width="175"><%=jfwcount%></td>
    	<td align="center"  width="175"><%=jfmcount%></td>
    	<td align="center"  width="175"><%=jfcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">후기게시판 양식 건 수</td>
    	<td align="center"  width="175"><%=wfdcount%></td>
    	<td align="center"  width="175"><%=wfwcount%></td>
    	<td align="center"  width="175"><%=wfmcount%></td>
    	<td align="center"  width="175"><%=wfcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >7</td>
    	<td align="center"  width="450">문의게시판 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=cscount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >8</td>
    	<td align="center"  width="450">문의 게시판 미 답변 건 수</td>
    	<td align="center"  width="175"><%=regcount%></td>
    	<td align="center"  width="175"><%=wecount%></td>
    	<td align="center"  width="175"><%=moncount%></td>
    	<td align="center"  width="175"><%=csstcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >9</td>
    	<td align="center"  width="450">문의 게시판 답변 완료 건 수</td>
    	<td align="center"  width="175"><%=regscount%></td>
    	<td align="center"  width="175"><%=weecount%></td>
    	<td align="center"  width="175"><%=montcount%></td>
    	<td align="center"  width="175"><%=csstacount%></td>
	</tr>
		<tr height="30">
    	<td align="center"  width="75" >10</td>
    	<td align="center"  width="450">이벤트 게시판 총 건 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=evcount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >11</td>
    	<td align="center"  width="450">이벤트 게시판 진행중 건 수</td>
    	<td align="center"  width="175"><%=evdcount%></td>
    	<td align="center"  width="175"><%=evwcount%></td>
    	<td align="center"  width="175"><%=evmcount%></td>
    	<td align="center"  width="175"><%=evicount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >12</td>
    	<td align="center"  width="450">이벤트 게시판 종료된 건 수</td>
    	<td align="center"  width="175"><%=evedcount%></td>
    	<td align="center"  width="175"><%=evewcount%></td>
    	<td align="center"  width="175"><%=evemcount%></td>
    	<td align="center"  width="175"><%=evecount%></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >13</td>
    	<td align="center"  width="450">총 회원 수</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175">-</td>
    	<td align="center"  width="175"><%=memcount%></td>
	</tr>
		<tr height="30">
    	<td align="center"  width="75" >14</td>
    	<td align="center"  width="450">신규 회원 수</td>
    	<td align="center"  width="175"><%=dmemcount%></td>
    	<td align="center"  width="175"><%=wmemcount%></td>
    	<td align="center"  width="175"><%=mmemcount%></td>
    	<td align="center"  width="175"><%=mmemcount%></td>
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
    	<td align="center"  width="175"><input type="button" value="글쓰기" onclick="window.location='/TeamProject/CSBoard/csBoardList.jsp'"/></td>
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