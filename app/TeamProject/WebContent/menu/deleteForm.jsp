<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1>deleteForm-글삭제</h1>

<%
   String num = request.getParameter("num");
   // "삭제하시겠습니까? " 출력후 삭제 진행
%>
   <script>
      var re = confirm("<%=num%>번 글을 삭제하시겠습니까?");
      if(re){
         window.location="deletePro.jsp?num=<%=num%>";
      }else{
         history.go(-1);
      }
   </script>
   