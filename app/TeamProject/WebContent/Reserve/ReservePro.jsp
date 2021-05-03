<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>예약페이지 Pro</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Reserve.ReserveDTO" />
<jsp:setProperty property="*" name="dto"/>
