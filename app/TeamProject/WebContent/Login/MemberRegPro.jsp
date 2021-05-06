<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="Login.MemberDAO" %>
<%@ page import="Login.ValueCheck" %>

	

<h1>회원가입 Pro</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Login.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>

<%
   ValueCheck vc = new ValueCheck();
	

	String pw = dto.getPw1();
	
		
   if(pw != null) // 이전부분에서 스크립트 처리를 해주어도 null비교는 해주어야 한다.
   {
      boolean aa = vc.charLength(pw, 6, 11);
      boolean bb = vc.charBig(pw);
      boolean cc = vc.charSmall(pw);
      
      int size = pw.length();
      int count = 0;
      int x=0, y=0, z=0;
      
      
      
      for(int i=0; i < size; i++)
      {
         char c = pw.charAt(i);
         if(c ==33 || c == 63 || c == 94 || c == 88 ||  c == 35 ||  c == 36 || c == 37)
         {
            z++;
         }
      }
      
      
      if(aa && bb && cc && z !=0){
    
    	 dao.insertMember(dto);
    	  
      }else{%>
    	  <script>
			alert("비밀번호가 적절하지 않습니다.");
			history.go(-1); 
		</script>
      	
    	  
            
 <%   }else{
	   
   }%>




