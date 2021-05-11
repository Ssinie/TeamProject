<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="Login.MemberDAO" %>
<%@ page import="Login.MemberDTO" %>
<%@ page import="Login.ValueCheck" %>

	

<h1>Id 확인</h1>

<%
request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="dto"  class="Login.MemberDTO" />
<jsp:setProperty property="*" name="dto"/>

<%
   MemberDAO dao = new MemberDAO();
   ValueCheck vc = new ValueCheck();

	String id = dto.getId();	
		
	 boolean aa = vc.ischarLength(id, 5, 11);  //아이디 길이체크

   if(id != null && aa) // 이전부분에서 스크립트 처리를 해주어도 null비교는 해주어야 한다.
   {

     MemberDTO member = dao.getMember(id);
      if(member == null){
    	  %>
			"사용 가능한 아이디 입니다."
      	
    <%	  
      }else{%>
    	 
			"중복된 아이디 입니다."
      	
    <%
      } 
   } else {
	   %>
 	 "아이디형식에 맞지 않습니다."
			
 <%
   }
%> 



