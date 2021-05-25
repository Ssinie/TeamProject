<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import= "Login.MemberDAO" %>
<h1>deletePro</h1>

<%
	String pw1 = request.getParameter("pw1");
	String id = (String)session.getAttribute("memId"); //세션아이디
	MemberDAO dao = new MemberDAO();
	boolean result= dao.loginCheck(id, pw1);
	if(result) {
		dao.statusChange(id);
		session.invalidate();  // 세션 모두 삭제 %>	
				
		<script>
		alert("탈퇴되었습니다..");
		parent.document.location.reload();
		location.href="/TeamProject/Top/TopPage.jsp";
		</script>
	
   
<%	}else{ %>
		<script>
			alert("pw 를 확인하세요");
			history.go(-1);
		</script>
<%	} %>







