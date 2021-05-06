<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.EventBoardDTO" %>
<%@ page import="event.EventBoardDAO" %>    

<center><h1><b>이벤트 내용</b></h1></center>

<%
	String id = (String)session.getAttribute("memId");

   int num = Integer.parseInt(request.getParameter("num"));
// 해당 글의 조회수 1증가 
// 글번호에 맞는 내용을 DB에서 가져온다.
   EventBoardDAO dao = new EventBoardDAO();
   dao.readCount(num);
   EventBoardDTO dto = dao.getContent(num);
%>
   <table  width="870" height="500" border="1" cellspacing="0" cellpadding="0"  align="center">
      <tr>
      <td>
         글번호 : <%=dto.getNum() %>
      </td>
         </tr>
       <tr>
       <td>
         작성자 : <%=dto.getWriter() %>
        </td>
        </tr>
        <tr>
         <td>
           제목 : <%=dto.getSubject() %>
      </td>
        </tr>
       <tr>
         <td>
            조회수  : <%=dto.getReadcount() %>
        </td>
        </tr>
        <tr>
        <td>
          작성 날짜 : <%=dto.getRe_date() %>
       </td>
       </tr>
        <tr>
        <td>
          이벤트 시작일 : <%=dto.getSt_date() %>
       </td>
       </tr>
        <tr>
        <td>
          이벤트 종료일 : <%=dto.getEnd_date() %>
       </td>
       </tr>
       <tr>
       <td height="300" style="vertical-align: top;" >
          내용 : <%=dto.getContent() %>
       </td>
       </tr>
    <!-- 내용 노출이 되도 상관없으면 &로 다 전달해도 좋음. -->
    <tr>      
    <td colspan=2 align="center"> 
    <%if(id != null && id.equals("admin")){%>	
    	<input type="button" value="수정"  onclick="window.location='updateForm.jsp?num=<%=dto.getNum()%>&writer=<%=dto.getWriter()%>&subject=<%=dto.getSubject()%>&content=<%=dto.getContent()%>'" />  
        <input type="button" value="삭제"  onclick="window.location='deleteForm.jsp?num=<%=dto.getNum()%>'"/>
        <input type="button" value="글목록" onclick="window.location='list.jsp'"/>
    <%}else{%>    
        <input type="button" value="글목록" onclick="window.location='list.jsp'"/>
    <%} %>
   </td></tr></table>



