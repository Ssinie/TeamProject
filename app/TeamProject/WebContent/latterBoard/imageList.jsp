<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "latterboard.LatterBoardDAO" %>
<%@ page import = "latterboard.LatterBoardDTO" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.text.SimpleDateFormat" %>
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
		<tr align="right">
			<td colspan="3">
				<input type="button" value="장바구니 보기" onclick="fnView()" />
			</td>
		</tr>
		<%
		for(int i = 0; i < articleList.size(); i++) {
			LatterBoardDTO dto = (LatterBoardDTO)articleList.get(i);
			if(i % 3 == 0) { %>
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
			if(i % 3 == 2) {%>
				</tr>
			<%}
		}%>	
	</table>
</div>
</body>
</html>