<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="Reserve.ReserveDTO" %>
<%@ page import="Reserve.ReserveDAO" %>  
<%@ page import="connection.ConnectionDAO" %> 

 <h1>예약페이지 Pro</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Reserve.ReserveDTO" />
<jsp:setProperty property="*" name="dto"/>

<%  
	String guest = (String)session.getAttribute("memId");
	if(guest == null){
	guest = "guest";
	}
	ReserveDAO dao = new ReserveDAO();
	dao.insertReservation(dto);
%>
<script>
alert("예약이 완료되었습니다. 감사합니다.");

parent.document.location.reload();
location.href="/TeamProject/Top/TopPage.jsp";

</script>