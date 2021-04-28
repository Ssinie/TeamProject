<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title> Q&A 1:1 문의 게시판 </title>
    <b align="center"><font size="5" color="lightblack"> Q&A</font></b>

	<form action="csBoardWritePro.jsp" method="post" enctype="multipart/form-data">
	<table width="700" border="3" cellpadding="0" cellspacing="0" bordercolor="dddddd" align="center">
		<tr>
			<td id="title">작성자</td>
			<td> 코드로 작성자 ID 넣을곳임!!! </td>
		</tr>
		<tr>
			<td id="title">제목</td>
			<td> <input name="subject" type="text" size="90" maxlength="100" value=""></td>
		</tr>
		<tr>
			<td id="title">내용</td>
			<td><textarea rows="20" cols="72" name="content"></textarea></td>
		</tr>
		<tr>
			<td id="title">파일첨부</td>
			<td> <input type="file" name="save"></td>
		</tr>
		
		<tr align="center" valign="middle">
			<td colspan="5">
				<input type="reset" value="작성취소">
				<input type="submit" value="등록">
				<input type="button" value="목록">
			</td>
		</tr>
	</table>
	</form>