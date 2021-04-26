<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<h1> 메뉴 글쓰기</h1>

<script>
function Check(){
	var title =document.inform.title.value; 
	var writer =document.inform.writer.value; 
	if(title=="" ){
		alert("제목을 입력하세요.");
		document.inform.title.focus();
		return false;
	}else if(writer==""){
		alert("작성자를 입력하세요.");
		document.inform.writer.focus();
		return false;
	}
}
</script>


 <form name="inform" action="insert.jsp" method="post" onsubmit="return Check();" enctype="multipart/form-data" >
<table border="1"  width="300">
<tr><td>		
 제목 : <input type="text" name="title"/><br/>
 </td></tr>
   <tr><td>
 작성자: <input type="text" name="writer"/><br/>
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
