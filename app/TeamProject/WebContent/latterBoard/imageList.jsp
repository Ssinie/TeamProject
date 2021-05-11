<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>

<script>
	document.onkeydown = trapRefresh;
	function trapRefresh(){
		if(event.keyCode == 116){
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
			document.location.reload();
		}
	}
</script>
<%
	int pageSize = 16;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	String pageNum = request.getParameter("pageNum");
	
	if(pageNum == null){
		pageNum = "1";
	}
	
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage - 1) * pageSize + 1;
	int endRow = currentPage * pageSize;
	int count = 0;
	int number = 0;
	
	List articleList = null;
	LatterBoardDAO dao = new LatterBoardDAO();
	count = dao.getArticleCount();
	if(count > 0){
		articleList = dao.getArticles(startRow, endRow);
	}
	number = count-(currentPage-1)*pageSize;
	String id = (String)session.getAttribute("memId");
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ShopMallMain JSP</title>
</head>
<body>
<div align="center">
	<h3>[후기 게시판]</h3>
	<table border="1">
		<tr>
			<td align = "right" colspan="4">
			<input type="button" value = "글쓰기" onclick="window.location='writeForm.jsp'" />
			</td>
		</tr>
		
		<tr>
			<td colspan="4">
				<a href="imageList.jsp">전체</a>
				<a href="typeList.jsp?menu=<%="japanese"%>">일식</a>
				<a href="typeList.jsp?menu=<%="korean"%>">한식</a>
				<a href="typeList.jsp?menu=<%="western"%>">양식</a>
			</td>
		</tr>
		
		<%
		if(count == 0){%>
		<table width="700" border="1" cellpadding="0" cellspacing="0">
			<tr>
				<td align="center">
					게시판에 저장된 글이 없습니다.
				</td>
			</tr>
		</table>

		<%}
		else{
			for(int i = 0; i < articleList.size(); i++) {
				LatterBoardDTO dto = (LatterBoardDTO)articleList.get(i);
				if(i % 4 == 0) { %>
					<tr align='center'>
				<%} %>
					
					
					<td>
					<table>
						<tr align='center'>
							<td>
								<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
								<%
								if(dto.getFilepath() != null){%>
								<img src = "<%=dto.getFilepath() %>" width='150' height='150' />
								<%}else{%>
								<img src = "/TeamProject/Images/latterBoard/unnamed.gif" width='150' height='150' />
								<%}%>
								</a>
							</td>
						</tr>
						<tr align='center'>
							<td>
								<a href="content.jsp?num=<%=dto.getNum()%>&pageNum=<%=currentPage%>">
								<%=dto.getSubject()%>
								</a>
							</td>
						</tr>
						<tr align='center'>
							<td>
								<%=dto.getWriter()%>
							</td>
						</tr>
						<tr align='center'>
							<td>
							<%=sdf.format(dto.getReg_date())%>
							</td>
						</tr>
					</table>
				</td>
				<%
				if(i % 3 == 3) {%>
					</tr>
				<%}
			}
		}%>	
	</table>
</div>
<center>
<%
if(count > 0){
	
	int pageCount = count / pageSize + ( count % pageSize == 0 ? 0 : 1 );
	
	int startPage = (int)(currentPage/10)*10+1;
	int pageBlock = 10;
					 
	int endPage = startPage + pageBlock -1;
	if(endPage > pageCount) endPage = pageCount;
	
	if(startPage > 10){%>
		<a href="list.jsp?pageNum=<%= startPage - 10 %>">[이전]</a>
	<%}
	for(int i = startPage; i <= endPage; i++){%>
		<a href="list.jsp?pageNum=<%= i %>">[<%= i %>]</a>
	<%}
	if(endPage < pageCount){%>
		<a href="list.jsp?pageNum=<%= startPage + 10 %>">[다음]</a>
	<%}
}%>
<form action="searchList.jsp" method="post">
	<select name="col">
		<option value = "subject">제목</option>
		<option value = "writer">작성자</option>
	</select>
	<input type="text" name="search" />
	<input type="submit" value="검색" />
</form>
</center>
</body>
</html>