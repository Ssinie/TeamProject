<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<Body align = "center">    
<section>
    <h1>회원가입 페이지</h1>
  </section>
  
  <section>
  *는 필수사항입니다.<br><br>
  
    <script>
    function checkDuplicationId() { //아이디중복값체크
    	var inputId = document.getElementById("first_id").value; //입력한아디값을 var 인풋id 변수에 저장  /  아이디중복값체크때 false나면 입력한아이디가 날라가서 새창에 함
    	window.open("IdCheckPro.jsp?id="+inputId,'','width=410px, height=200px') //파라미터 아이디를 받아 IdCheckPro.jsp 로 보낸다  아이디체크프로.jsp 빈작업으로 dto에 들어감 
    }
    
    function checkAllValidate(form) {  //아이디외에 다른값들 확인하기 위해 만듦
    	var id1 = document.getElementById("first_id").value;
    	form.action = 'MemberRegPro.jsp?id='+id1; //id1값을 가지고 멤버레그프로로 가서 bean작업을 통해 dto로
    	form.submit();//액션으로 보낸다
    }
    </script>
      *아이디(5자~11자까지 가능)<br>
      <input type="text" name="id" id="first_id" placeholder="5자~11자까지 가능" required>  <%-- Placeholder는 빈칸에 설명채워넣는 명령어 --%>
      <input type="submit" name="idcheck" value="아이디 확인"  onclick="checkDuplicationId()" >      
      <br><br>
     
      <form name="myForm" action="" method="post">
      *비밀번호 (대,소,특수문자를 포함한 6~20자)<br> 
      <input type="password" name="pw1" value="" required placeholder="비밀번호입력 "><br>
      *비밀번호 재확인<br> 
      <input type="password" name="pw2" value="" placeholder="비밀번호 재입력 "required>
      <br><br>
      
      *이름<br>  <input type="text" name="name" value="" required> 
      <br><br>
      
      *생년월일<br> 
      <select name="year" required>
        <option value="">-- 선택 --</option>
        <option value="1983">1983</option>
        <option value="1984">1984</option>
        <option value="1985">1985</option>
        <option value="1986">1986</option>
        <option value="1987">1987</option>
        <option value="1988">1988</option>
        <option value="1989">1989</option>
        <option value="1990">1990</option>
        <option value="1991">1991</option>
        <option value="1992">1992</option>
        <option value="1993">1993</option>
        <option value="1994">1994</option>
        <option value="1995">1995</option>
        <option value="1996">1996</option>
        <option value="1997">1997</option>
        <option value="1998">1998</option>
        <option value="1999">1999</option>
        <option value="2000">2000</option>
        <option value="2001">2001</option>
        <option value="2002">2002</option>
      </select>
      <select name="month" required>
        <option value="">-- 선택 --</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
      </select>
      <select name="day" required>
        <option value="">-- 선택 --</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
        <option value="11">11</option>
        <option value="12">12</option>
        <option value="13">13</option>
        <option value="14">14</option>
        <option value="15">15</option>
        <option value="16">16</option>
        <option value="17">17</option>
        <option value="18">18</option>
        <option value="19">19</option>
        <option value="20">20</option>
        <option value="21">21</option>
        <option value="22">22</option>
        <option value="23">23</option>
        <option value="24">24</option>
        <option value="25">25</option>
        <option value="26">26</option>
        <option value="27">27</option>
        <option value="28">28</option>
        <option value="29">29</option>
        <option value="30">30</option>
        <option value="31">31</option>
      </select>
      <br><br>
      
      성별<br>  
      <label for="man">남자</label>
      <input type="radio" name="gender" value="남" id="man">
      <label for="woman">여자</label>
      <input type="radio" name="gender" value="여" id="woman"> <br><br>
      *이메일<br><input type="email" name="email" placeholder="email@gmail.com" required>
      <br><br>
      
      *휴대전화<br>
      <select>
      <option>SK</option>
      <option>KT</option>
      <option>LG U+</option>
      <option>알뜰폰</option>
      </select>
      <input type="text" name="phone" placeholder="010-****-****" required>
     <!--  <input type="button" name="certification" value="인증번호 받기"><br>
      <input type="text" name="certification" placeholder="인증번호를 입력하세요" required>
      <input type="button" name="certification" value="확인"> 
      <br><br>
      
      사진 <br>
      <input type="file" value="">-->
      <br><br>
      <input type="submit" value="가입완료" onclick="checkAllValidate(this.form)">
      
    </form>
  </section>
