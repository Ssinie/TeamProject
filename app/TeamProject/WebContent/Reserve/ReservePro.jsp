<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page 
		import java.sql.Connection;
		import java.sql.PreparedStatement;
		import java.sql.ResultSet;

		import connection.ConnectionDAO;

		public class MemberDAO{
		private Connection conn = null;
		private PreparedStatement pstmt = null;
		private ResultSet rs = null;
 %>
	
	
<h1>예약페이지 Pro</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Reserve.ReserveDTO" />
<jsp:setProperty property="*" name="dto"/>


<%
//DB연결하고 중복값확인후 DB에 올리기


%>
