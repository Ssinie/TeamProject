<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<script>
function setCookie(name, value, expiredays){ //쿠키설정 기능
	var today = new Date(); //today에 현재데이트 값을 넣어준다
	today.setDate(today.getDate() + expiredays); // 투데이에 설정된 데이트값에 만료일을 넣어 셋데이트에 대입
	
	document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString()+ ';' //쿠키값 저장 만료기준이 되는 데이트 값을 저장
}

function closePop(){
	if(document.getElementById("todayPop").checked){
		setCookie('todayPop','popUp',1);
	}
	self.close();
}
</script>
    

<table>
    <tr>
    	<td>
    	 	<img src="/TeamProject/PopUp/팝업.jpg"/>
 	 	</td>
 	</tr>
 	<tr>
 	 	<td align= "center">
 	 	 	<input type="checkbox" id = "todayPop" onclick= "closePop()">오늘하루 이창을 열지않음
 	 	 	 	 	 	
 	 	</td>
    </tr>
</table>


