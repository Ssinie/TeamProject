<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="Login.MemberDAO" %>
<%@ page import="Login.ValueCheck" %>
<%@ page import="Login.MemberDTO" %>

	

<h1>회원가입 Pro</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Login.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>

<%
   ValueCheck vc = new ValueCheck();
   MemberDAO dao = new MemberDAO();

	String pw = dto.getPw1();
	String pw2 = dto.getPw2();
	System.out.println(dto.getId());
	
		
   if(pw != null) // 이전부분에서 스크립트 처리를 해주어도 null비교는 해주어야 한다.
   {
      boolean aa = vc.ischarLength(pw, 6, 20);  //비번 길이체크
      boolean bb = vc.ischarBig(pw); //비번 대문자체크
      boolean cc = vc.ischarSmall(pw);
      boolean dd = vc.isSpecial(pw);
      boolean ee = vc.isSame(pw,pw2);
     
      if(!ee)
    	  %>
	  <script>
		alert("재확인 비밀번호가 다릅니다.");
		history.go(-1); 
	</script>
  	
<%
    	  
      if(aa && bb && cc && dd && ee){
    
    	 dao.insertMember(dto);
    	session.setAttribute("memId", dto.getId());
    	response.sendRedirect("/TeamProject/Top/TopPage.jsp");
    	  
      }else{%>
    	  <script>
			alert("비밀번호가 적절하지 않습니다.");
			history.go(-1); 
		</script>
      	
    <%
      } 
   } else {
	   %>
 	  <script>
			alert("비밀번호를 재입력해주세요.");
			history.go(-1); 
		</script>
   	
 <%
   }   
%> 



