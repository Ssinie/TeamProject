<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reserve.ReserveDAO" %>
<%@ page import="Reserve.ReserveDTO" %>
<%@ page import="java.util.List" %>
<%
	String id = (String)session.getAttribute("memId");
	if(id == null){%>
		<script>
		alert("회원정보가 올바르지 않습니다. 다시 로그인해주세요.");
		location.href="TeamProject/Login/Login.jsp";
		</script>
	<%}
	ReserveDAO dao = new ReserveDAO();
	ReserveDTO dto = new ReserveDTO();
	List ResList = dao.idInfo(id);
	if(ResList.isEmpty()){%>
		<script>
		alert("회원님의 예약기록이 없습니다.");
		location.href="TeamProject/Reserve/ReserveMain.jsp";
		</script>
	<%}
	for(int i =0; i < ResList.size(); i++){
		dto = (ReserveDTO)ResList.get(i);%>
		<table border="2">
		<tr>
		<td>예약번호</td>
		<td><%=dto.getRes_num()%></td>
		</tr>
		<tr>
		<td>게스트</td>
		<td><%=dto.getGuest()%></td>
		</tr>
		<tr>
		<td>Tel</td>
		<td><%=dto.getTel()%></td>
		</tr>
		<tr>
		<td>인원 수</td>
		<td><%=dto.getPerson_no()%></td>
		</tr>
		<tr>
		<td>날짜</td>
		<td><%=dto.getReservation_date()%></td>
		</tr>
		<tr>
		<td>시간</td>
		<td><%=dto.getReservation_time()%></td>
		</tr>
		<tr>
		<td>층 수</td>
		<td><%=dto.getFloor()%></td>
		</tr>
		<tr>
		<td>Opt</td>
		<td><%=dto.getOpt()%></td>
		</tr>
		<tr>
		<td>write_Time</td>
		<td><%=dto.getWRITE_TIME()%></td>
		</tr>
		</table>
	<%}
%>