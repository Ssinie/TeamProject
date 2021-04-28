<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> 메뉴 글쓰기</h1>

<script>
function Check(){
	var subject =document.inform.subject.value; 
	var name =document.inform.name.value; 
	if(subject=="" ){
		alert("제목을 입력하세요.");
		document.inform.subject.focus();
		return false;
	}else if(name==""){
		alert("메뉴 이름을 입력하세요.");
		document.inform.name.focus();
		return false;
	}
}
</script>



 <form name="inform" action="WritePro.jsp" method="post" onsubmit="return Check();" enctype="multipart/form-data" >
<table border="1"  width="300">
<tr><td>		
 제목 : <input type="text" name="subject"/><br/>
 </td></tr>
   <tr><td>
 메뉴 이름: <input type="text" name="name"/><br/>
</td></tr>
   <tr><td>
 음식 종류: <select name="type">
					<option>한식</option>
					<option>일식</option>
					<option>서양식</option>
 </select>
 <br/>
</td></tr>
 <tr><td>
 내용:<textarea rows="20" cols="50" name="content"/> </textarea><br/>
   </td></tr>
 <tr><td>	
 파일:<input type="file" name="file"/><br/>
   </td></tr>
 <tr><td>	
 <input type="submit" value="확인"/>
   </td></tr>
 </table>
</form>
