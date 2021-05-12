<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>예약페이지 Form</h1>
<% String id = (String)session.getAttribute("memId"); %>
<Body bgcolor="lightyellow">
<form method = "get" action = "ReservePro.jsp">
	<fieldset>
			<legend> 예약자 정보</legend>
			<label for = "sub"> 예약자:</label><%
			if(id == null){
				id = "게스트";%>
			<%}%>
			<%=id%>
			<input type = "hidden" name = "guest" value ="<%=id%>"> <br>
			<label for = "phone"> 휴대폰:</label>
			<input type = "tel" name = "tel" id = "phone" placeholder= "010-****-****" required>
				
			예약인원:
			<select name = "person_no" size="1" required>
					<option value ="2">2명</option>
					<option value ="3">3명</option>
					<option value ="4">4명</option>
					<option value ="5">5명</option>
					<option value ="6">6명</option>
					<option value ="7">7명</option>
					<option value ="8">8명</option>
					<option value ="9">9명</option>
					<option value ="10">10명</option>
			</select>	
		</fieldset>	
		
		<fieldset>
				<legend>날짜 및 시간 선택</legend>
				<input type = "date" name = "reservation_date"/ required>
				<input type = "time" name = "reservation_time" min="09:00" max="20:00"/ required><br>
							
								
				<label for = "position"> 위치:</label>
				<input type = "radio" name = "floor" id = "position" value = "1"/ required> 1층
				<input type = "radio" name = "floor" id = "position" value = "2"/ required> 2층<br>	
				
				<label for = "choice"> 옵션:</label>
				<input type = "checkbox" name = "opt" id = "choice" value = "baby_chair">아기의자
				<input type = "checkbox" name = "opt" id = "choice" value = "발렛파킹"> 발렛파킹
				<input type = "text" name = "opt" id = "choice" value = "">기타 
				
		</fieldset>						
		<br>
		
		<input type = "submit" value = "예약"/>
		<input type ="reset" value = "취소"/>
</form>
