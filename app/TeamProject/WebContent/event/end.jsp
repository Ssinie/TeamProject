<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="event.EventBoardDAO" %>
<%@ page import="event.EventBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>   

<%
	String id = (String)session.getAttribute("memId");
    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    String pageNum = request.getParameter("pageNum");
    System.out.println(pageNum);
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;
    int number=0;

    List endlist = null;
    EventBoardDAO dao = new EventBoardDAO();
    count = dao.getArticleCount();
    if (count > 0) {
       endlist = dao.getend(startRow, endRow);
       System.out.println(endlist);
    }

   number=count-(currentPage-1)*pageSize;
%> 

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="44.css"> 
  </head>
    <body>
    <div id="container_body">
      <div id="container">
        <header>
           <nav>
             <ul id="topMenu">
               <li><h3><a href="#" style="padding: 0 300px 0 300px;">진행중인 이벤트</a></h3></li>
                
               <li><h3><a href="#" style="padding: 0 300px 0 0;">종료된 이벤트</a></h3></li>
             </ul>
           </nav>
        </header>
        
<div id="contents">
	<div id="links">
    		<%if(id != null && id.equals("admin")){%>
           		<a href="WriteForm.jsp">글쓰기</a>
           		<a href="/TeamProject/Top/TopPage.jsp">HOME</a>
           <%}else{%>
           		<b><em>이벤트 게시글은 관리자만 작성 가능합니다.</em></b>
           		<a href="/TeamProject/Top/TopPage.jsp">HOME</a>
           	<%} %>
           </div>
           
			<%if (count == 0) {%>
  			 <table  width="1200" border="1" cellpadding="0" cellspacing="0">
     			 <tr>
          			<td boder=1 align="center">게시판에 저장된 글이 없습니다.</td>
       			</tr>
  			 </table>
			<%} else {
					for (int i = 0 ; i < endlist.size() ; i++) {
		 				EventBoardDTO dto = (EventBoardDTO)endlist.get(i);
		 				if(i % 3 == 0) { %>
		 		
						<% } %>
		<div id="container2">
           <div id="board" >
            <div class="list_wrap" >
              <div id="box">        
                 <ul>
                   <li class="item">
                     <div class="aaa"><a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>"><img class="image" src="<%=dto.getFilePath() %>" /></a></div>
                     <div class="cont">
                       <strong><%--! <%=number--%> </strong> 
                       <strong><a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>"><%=dto.getSubject() %></a></strong>
                       <p>이벤트 종료일 : <%=dto.getEnd_date()%></p>
                       <%-- <p><a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">바로가기</a></p>    --%>             
                     </div>
                   </li>     
                 </ul>         
               </div>
              </div>
            </div>
         </div>
</div> 
		        <%
					if(i % 3 == 3) {%>
				<%}
		  	 }
		}%>	
</div>		
<div id="footer">    
<%

if(count > 0){
   
   int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1 );
   
   int startPage = (int)(currentPage/10)*10+1;
   int pageBlock = 10;
                
   int endPage = startPage + pageBlock -1;
   if(endPage > pageCount) endPage = pageCount;
   
   if(startPage > 10){%>
      <a href="cardlist.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
   <%}
   for(int i = startPage; i <= endPage; i++){%>
      <a href="cardlist.jsp?pageNum=<%= i %>">[<%= i %>]</a>
   <%}
   if(endPage < pageCount){%>
      <a href="cardlist.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
   <%}
}%>
</div>
</div>   
</body>
</head>
</html>
   