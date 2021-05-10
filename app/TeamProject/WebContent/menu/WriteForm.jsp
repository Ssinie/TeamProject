<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
li{margin-bottom:2px;  margin-right:2px;padding:2px;text-align:center;}
li.mystyle{margin-bottom:2px; list-style-type:none; margin-right:2px;padding:2px;text-align:center;}
#STATICMENU { positi 7on:absolute;font-size:20; margin: 0pt; padding: 0pt;  position: absolute; right: 0px; top: 0px; background-color:rgba(255,255,255,0.5);
}
</style>


<%String id = request.getParameter("id");  //admin 확인 %>
<center>
<h1> 메뉴 글쓰기</h1>
<body  >

 <form name="inform" action="WritePro.jsp" method="post" onsubmit="return Check();" enctype="multipart/form-data" >
<table border="1"  width="300" >
<tr><td>		
  메뉴 이름: <input type="text" name="subject"/><br/>
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
  <input type="hidden" name="id" value="<%=id %>"> 
 <input type="submit" value="확인"/>
 <input type="button" value="취소" onclick="window.history.back()" />
   </td>
   </tr>
 </table>
</form>
</body>
</center>