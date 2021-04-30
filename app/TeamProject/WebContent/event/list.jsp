<%@ page contentType = "text/html; charset=UTF-8" %>
<%@ page import = "five.EventBoardDTO" %>
<%@ page import = "five.EventBoardDAO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ include file="eventColor.jsp"%>

<%
    int pageSize = 10; //한 페이지에 모여질 게시물 수.
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm"); 
    //90줄. 작성날짜 해당 형식으로 보기 위함. => sdf.format(article.getReg_date())

    String pageNum = request.getParameter("pageNum");
    if (pageNum == null) { //처음 list.jsp 실행할때 null이기 때문에 1로 저장.
        pageNum = "1";
    }
	//pageNum이 Parameter값으로 넘어오지 않았다면, 맨 첫페이지로.
    int currentPage = Integer.parseInt(pageNum); //현재페이지 => 1
	int startRow = (currentPage - 1) * pageSize + 1; //시작번호 => (1-1) * 10 + 1 = 1 
    int endRow = currentPage * pageSize; //끝번호 => 1 * 10 = 10
    int count = 0; //전체글 => 11
    int number = 0;//11

    List articleList = null; //리스트 articleList 생성.
    EventBoardDAO db = new EventBoardDAO(); //변수 dbPro를 선언해서 BoardDBBean 객체생성.
    count = db.getArticleCount(); //count변수에 대입(전체 DB에 입력된 행의 수)
    //System.out.println(count); //게시글을 등록한 갯수 11개가 저장되어 있음.
    
    if (count > 0) { //0이상이라는건 등록되어 있는 데이터가 있다는 의미.
        articleList = db.getArticles(startRow, endRow); //articleList에 대입(BoardDBBean.java에 getAricles 메소드)
    }
	number = count-(currentPage-1)*pageSize; //num에 대입 11 - (1-1) * 10
	
	String id = (String)session.getAttribute("memId");
%>

<html>
<head>
<title>게시판</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>

<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
	<tr>
    	<td align="right" bgcolor="<%=value_c%>">
    	<%if(id != null){ %>
    		<a href="writeForm.jsp">글쓰기</a>
    	<%}else{ %>
    		<a href="/jsp/jspEx/0416/loginForm.jsp">로그인 후 글쓰기</a>
    	<%} %>
    	</td>
    </tr>
</table>

<%if (count == 0) {%> <%-- 게시글이 없으면 --%>
	<table width="700" border="1" cellpadding="0" cellspacing="0">
		<tr>
    		<td align="center">
    			게시판에 저장된 글이 없습니다.
    		</td>
    	</tr>
	</table>

<%  } else {    %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center"> 
	<tr height="30" bgcolor="<%=value_c%>"> 
		<td align="center"  width="50"  >번 호</td> 
		<td align="center"  width="250" >제   목</td> 
	    <td align="center"  width="100" >작성자</td>
	    <td align="center"  width="150" >작성일</td> 
	    <td align="center"  width="50" >조 회</td> 
	    <td align="center"  width="100" >IP</td>    
    </tr>
<%	for (int i = 0 ; i < articleList.size() ; i++) {
    	EventBoardDTO dto = (EventBoardDTO)articleList.get(i);
%>
	<tr height="30"> 
    	<td align="center"  width="50" > <%=number--%></td>
    	<td  width="250" >
			<%int wid=0; 
		      if(dto.getRe_level()>0){
		      	wid=5*(dto.getRe_level()); %>
		  		<img src="images/level.gif" width="<%=wid%>" height="16">
		  		<img src="images/re.gif">
			<%}else{%> 
		  		<img src="images/level.gif" width="<%=wid%>" height="16"> 
			<%}%>
     		 <a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
           		<%=dto.getSubject()%>
           	 </a> 
          <% if(dto.getReadcount()>=20){%>
         	<img src="images/hot.gif" border="0"  height="16">
           <%}%> 
		</td>
    	<td align="center"  width="150"><%= sdf.format(dto.getRe_date())%></td>
    	<td align="center"  width="50"><%=dto.getReadcount()%></td>
	</tr>
    <%}%>
</table>
<%}%>

<%
    if (count > 0) { //전체 페이지 수를 연산
        int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1);
		 /* 글수를 페이지수로 나누었을때 나누어 떨어지면 페이지수에 맞게 나누어 떨어지는 것이고
		 0이 아닐때에는 글수가 남아있는것이므로 페이지수 +1 */
        int startPage = (int)(currentPage/10)*10+1;
		int pageBlock=10;
		//5페이지 누르면 다음이 뜨는 문제를 해결하기 위한 기능
        //페이지수가 블럭이랑 나누어 떨어질때에는 5/10/15 까지 한페이지로 묶어준다.
        int endPage = startPage + pageBlock-1;
        if (endPage > pageCount) 
        		endPage = pageCount;
        
        if (startPage > 10) {    %> <%-- 이전 페이지 --%>
        <a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
<%      }
        for (int i = startPage ; i <= endPage ; i++) {  %>
        	<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
<%		}
        if (endPage < pageCount) {  %>
        	<a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
<%		}
    }
%>
</center>
</body>
</html>