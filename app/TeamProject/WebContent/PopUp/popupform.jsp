<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<script type="text/javascript">

function setCookie(name, value, expiredays){
	var today = new date();
	today.setDate(today.getDate() + expiredays);
	
	document.cookie = name + '=' + escape(value) + '; path=/; expires=' + today.toGMTString()+ ';'
}

function closePop(){
	if(document.forms[0].todayPop.checked)
		setCookie('todayPop','popUp',1);
	self.close();
}

</script>
    

<table>
    <tr>
    	<td>
    	 	<img src="/TeamProject/PopUp/팝업.jpg" />
 	 	</td>
 	</tr>
 	<tr>
 	 	<td align=center>
 	 	 	<input type="checkbox" name = "todayPop" onclick= "closePop()">오늘하루 이창을 열지않음
 	 	</td>
    </tr>
</table>



