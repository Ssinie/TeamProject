<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Login.MemberDAO" %>
<%@ page import="Login.ValueCheck" %>   
 
<h1>updatePro</h1>
<%	request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="dto"  class="Login.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>
<%
	String id = (String)session.getAttribute("memId"); // 세션 ID 
	dto.setId(id);
	MemberDAO dao = new MemberDAO();
	ValueCheck vc = new ValueCheck();
	
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
     
      if(!ee){
    	  %>
	  <script>
		alert("재확인 비밀번호가 다릅니다.");
		history.go(-1); 
	</script>
  	
	<%}
    	  
      else if(aa && bb && cc && dd && ee){
	
	   	dao.insertMember(dto);
    	session.setAttribute("memId", dto.getId());%>
    	<script>
    	alert("수정되었습니다.");
    	location.href="/TeamProject/Top/TopPage.jsp";
    	</script>
    	
    	  
      <%}
      else{%>
    	  <script>
			alert("비밀번호가 적절하지 않습니다.");
			history.go(-1); 
		</script>
		   <%}
      	
    
  }
  else 
  { %>
	   
 	  <script>
			alert("비밀번호를 입력해주세요.");
			history.go(-1); 
		</script>
<%}  	
	
	dao.updateMember(dto);
	%>






