<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Reserve.ReserveDAO" %>
<%@ page import="Reserve.ReserveDTO" %>
<%
/*
	1. res_num을 사용하여 조회하는 dao를 실행하여 dto를 받아와서 리턴...
	2. dto만 받아오면됨..(res_num 1개당 1개가 조회되기 때문에...)
*/

	int res_num = Integer.parseInt(request.getParameter("res_num"));
	
	ReserveDAO dao = new ReserveDAO();
	ReserveDTO dto = dao.resnumInfo(res_num);
	// ReserveDTO dto = new ReserveDTO();
	// dto = dao.resnumInfo(res_num);
	
	if(dto == null){
		// 사용자가 잘못된 예약번호 입력함 %>
		<script>
		alert("잘못된 예약번호입니다. 다시 입력하여주세요.");
		history.go(-1);
		</script><%
	}else{%>
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