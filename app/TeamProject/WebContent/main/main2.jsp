<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "menuboard.BoardDBBean" %>
<%@ page import = "menuboard.BoardDataBean" %>
<%@ page import="event.EventBoardDAO" %>
<%@ page import="event.EventBoardDTO" %>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="color.jsp"%>


<%
String id = request.getParameter("id"); //admin 확인


    int pageSize = 10;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) {
        pageNum = "1";
    }

    int currentPage = Integer.parseInt(pageNum);
    int startRow = (currentPage - 1) * pageSize + 1;
    int endRow = currentPage * pageSize;
    int count = 0;


    List articleList = null;
    List articleList2 = null;
    List articleList3 = null;
    
    BoardDBBean dbPro =new BoardDBBean();
    EventBoardDAO dao =new EventBoardDAO();
    LatterBoardDAO dao2 = new LatterBoardDAO();
    
    count = dbPro.getArticleCount();
    if (count > 0) {
        articleList = dbPro.getArticles(startRow, endRow);
        articleList2 = dao.getArticles(startRow, endRow);
        articleList3 = dao2.getArticles(startRow, endRow);
    }


%>
<html>
<head>

<title>Insert title here</title>
<link rel="stylesheet" href="/TeamProject/main/style.css">
   
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
	<!-- <script src="script/script.js"></script> -->
	<script>
$(document).ready(function () {
    $('.bxslider').bxSlider({    	
        auto: true, // 자동으로 애니메이션 시작
        speed: 500,  // 애니메이션 속도
        pause: 5000,  // 애니메이션 유지 시간 (1000은 1초)
        mode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical')
        autoControls: true, // 시작 및 중지버튼 보여짐
        pager: true, // 페이지 표시 보여짐
        captions: true, // 이미지 위에 텍스트를 넣을 수 있음       
        maxSlides:3,
        slideWidth:300,
        slideMargin:20,
        touchEnabled:false
    });
});
</script>
</head>



<body>
<%if (count == 0) {%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>

<%  } else {    %>

<center>
<%if (articleList.size() == 0) {%>
<h1>게시글이 없습니다.</h1>
<%}else{ %>
<div >
	<h2 class="titMain">메뉴 추천</h2>						
</div>

<ul class="bxslider">						

<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	BoardDataBean article = (BoardDataBean)articleList.get(i);
%>

<a href="/TeamProject/menu/content.jsp?num=<%=article.getNum() %>&id=<%=id %>" >
<li class="mystyle"><img src="<%=article.getFileimage()%>" height="220" width="300"> </li>						 								
<li class="mystyle"><strong ><%=article.getSubject()%></strong></li>
<li class="mystyle"><strong ><%=article.getPrice()%></strong></li>	
		</a>							
						             	
  <%  } %><!-- for문 종료 -->
 
</ul>
<%  } %> <!-- 게시글 0이 아닐때 -->
<div >
<%if (articleList2.size() == 0) {%>
<h1>게시글이 없습니다.</h1>
<%}else{ %>
	<h2 class="titMain">이벤트</h2>						
</div>
 <ul class="bxslider">	<!--  이벤트 페이지 -->

<%	for (int i = 0 ; i < articleList2.size() ; i++) {
	EventBoardDTO dto = (EventBoardDTO)articleList2.get(i);
%>

<a href="/TeamProject/event/content.jsp?num=<%=dto.getNum() %>&pageNum=<%=currentPage%>" >
<li class="mystyle"><img src="<%=dto.getFilePath() %>"  height="220" width="300" /></li>					 								
<li class="mystyle"><strong ><%=dto.getSubject()%></strong></li>		</a>							
						  
      	
  <%  } %><!-- for문 종료 -->
</ul>
<%  } %><!-- 게시글 0이 아닐때 -->

<%if (articleList3.size() == 0) {%>
<h1>게시글이 없습니다.</h1>
<%}else{ %>
<div >
	<h2 class="titMain">후기 게시판</h2>						
</div>
<ul class="bxslider">	
 <!--  후기 게시판 -->

<%	for (int i = 0 ; i < articleList3.size() ; i++) {
	LatterBoardDTO dto = (LatterBoardDTO)articleList3.get(i);
%>


<a href="/TeamProject/latterBoard/content.jsp?num=<%=dto.getNum() %>&pageNum=<%=currentPage%>" >
<li class="mystyle"><img src="<%=dto.getFilepath()  %>"  height="220" width="300" /></li>					 								
<li class="mystyle"><strong ><%=dto.getSubject()%></strong></li>		</a>							
						 
    	
  <%  } %><!-- for문 종료 -->

</ul>
<%  } %><!-- 게시글 0이 아닐때 -->
  <%  } %><!-- else 종료 -->
  

</body>
</html>