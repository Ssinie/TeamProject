<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<h1>로그인 페이지</h1>

<form name="login" action="LoginPro.jsp" method="post"></form>
로그인 해주세요.
			<form action="main.jsp">
				<div class="data">
					<label>Email아이디</label>
					 <input type="email" name="id" placeholder="이메일 입력" required>
				</div>
				<div class="data">
					<label>비밀번호</label>
					<input type="password" name="pw" placeholder="비밀번호 10~15자리" required>
				</div>
				<div>
				<input type="submit" value="로그인">
				<a href="forgotpass.jsp">비밀번호를 잊으셨나요?</a>
				<a href = "MemberReg.jsp"> 회원가입</a> <br></br>
				</div>
			</form>
			

