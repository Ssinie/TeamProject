<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="latterboard.CategoryDAO" %>
<%@ page import="latterboard.CategoryDTO" %>
<%@ page import="java.util.*" %>
<%
	// BOARD2의 한식 List, 일식 List 양식 List 를 가져옴...
	// List를 Option화..
	
	CategoryDAO dao = new CategoryDAO();
	CategoryDTO dto = new CategoryDTO();
	
	List korean = dao.SearchFood("한식", dto);
	List japanese = dao.SearchFood("일식", dto);
	List westurn = dao.SearchFood("서양식", dto);
	
%>

<table>
<tr>
	<td>종목</td>
	<td>
	<select name="type">
		<option value ="korean">한식</option>
		<option value ="japanese">일식</option>
		<option value ="westurn">서양식</option>
	</select>
	</td>
</tr>
	<td>메뉴</td>
	<td>
	<select name="name">
<%
	// DB연결하여 List배열로 가져오도록 설계...
	// 추후 select 값에 따라 option이 변경되는 js 구문을 추가하여야 함.
	int namevalue=0;
	for(int i = 0; i < korean.size(); i++){
	namevalue += i;%>
		<option value="<%=namevalue%>"><%=korean.get(i) %></option>
	<%}%>
	</select>
	</td>
</table>