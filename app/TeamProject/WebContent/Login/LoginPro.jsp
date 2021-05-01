<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Login.MemberDAO" %>  
<h1>loginPro</h1>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw1");
	
	// DB 에서 id/pw 입력하여 검색 해본다... 
	// 검색 결과가 나오면 로그인 성공 / 안나오면 로그인실패 
	MemberDAO dao = new MemberDAO();
	boolean result = dao.loginCheck(id, pw);
	if(result){
		session.setAttribute("memId", id);
		response.sendRedirect("/TeamProject/lobby/lobby.jsp");
%>		
<%	}else{ %>
		<script>
			alert("아이디와 비밀번호를 확인하세요");
			history.go(-1); //한페이지 뒤로가기
		</script>
<%	} %>




