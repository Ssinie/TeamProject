<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="latterboard.LatterBoardDTO" %>
<%@ page import="latterboard.LatterBoardDAO" %>
<%@ page import="latterboard.LBCommDAO" %>
<%@ page import = "java.sql.Timestamp"%>
<%request.setCharacterEncoding("UTF-8");%>

<jsp:useBean id = "dto" class="latterboard.LBCommDTO" />
<jsp:setProperty property="*" name="dto" />
<%
	// dto 'reg_date'와 'ip'에 사용자의 실시간 값으로 대입..
	dto.setReg_date(new Timestamp(System.currentTimeMillis()));
	dto.setIp(request.getRemoteAddr());
	
	// 댓글DAO 객체 생성 후 게시글의 댓글이 몇개인지 확인 후, 댓글dept를 지정하여 입력해줌..
	LBCommDAO dao = new LBCommDAO();	
	int count = dao.countComm(dto.getNum());
	dao.inputComm(dto, count);
	
	// 게시판에서 pageNum을 가져와, 댓글을 입력한 후 다시 게시판 글 페이지로 옮겨줌과 동시에 'Refresh'하여 작성된 댓글을 바로 보여줌...
	String pageNum = request.getParameter("pageNum");
%>
<meta http-equiv="Refresh" content="0;url=content.jsp?num=<%=dto.getNum()%>&pageNum=<%=pageNum%>" >
