<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = (String)session.getAttribute("memId");
%>
<title> Admin </title>

<body bgcolor="white">
<center><h3>愿�由ъ옄 �쟾�슜 �럹�씠吏�</h3>
<table width="800">
</table>

<table border="1" width="1050" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd"> 
		<td align="center"  width="75"  >No.</td> 
		<td align="center"  width="450" >LIST</td> 
	    <td align="center"  width="175" >COUNT-DAY</td>
	    <td align="center"  width="175" >COUNT-WEEK</td> 
	    <td align="center"  width="175" >COUNT-MONTH</td>
    </tr>
	<tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">�삁�빟 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">�썑湲곌쾶�떆�뙋 珥� 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">�썑湲곌쾶�떆�뙋 �븳�떇 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">�썑湲곌쾶�떆�뙋 �씪�떇 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">�썑湲곌쾶�떆�뙋 �뼇�떇 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">臾몄쓽寃뚯떆�뙋 珥� 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >7</td>
    	<td align="center"  width="450">臾몄쓽 寃뚯떆�뙋 誘� �떟蹂� 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >8</td>
    	<td align="center"  width="450">臾몄쓽 寃뚯떆�뙋 �떟蹂� �셿猷� 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >9</td>
    	<td align="center"  width="450">�씠踰ㅽ듃 寃뚯떆�뙋 吏꾪뻾以� 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >10</td>
    	<td align="center"  width="450">�씠踰ㅽ듃 寃뚯떆�뙋 醫낅즺�맂 嫄� �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >11</td>
    	<td align="center"  width="450">�쉶�썝 �닔</td>
    	<td align="center"  width="175">�씪�씪 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">二쇨컙 移댁슫�듃 肄붾뱶</td>
    	<td align="center"  width="175">�썡媛� 移댁슫�듃 肄붾뱶</td>
	</tr>
</table>
</br></br></br>
<table border="1" width="875" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="dddddd">
		<td align="center"  width="75"  >No.</td> 
		<td align="center"  width="450" >寃뚯떆�뙋 �씠由�</td> 
	    <td align="center"  width="175" >湲��벐湲� 諛붾줈媛�湲�</td>
	    <td align="center"  width="175" >寃뚯떆�뙋 諛붾줈媛�湲�</td> 
    </tr>
    <tr height="30">
    	<td align="center"  width="75" >1</td>
    	<td align="center"  width="450">硫붾돱 寃뚯떆�뙋</td>
    	<td align="center"  width="175"><input type="button" value="湲��벐湲�" onclick="window.location='/TeamProject/menu/WriteForm.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="硫붾돱 諛붾줈媛�湲�" onclick="window.location='/TeamProject/menu/menupage.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >2</td>
    	<td align="center"  width="450">�씠踰ㅽ듃 寃뚯떆�뙋</td>
    	<td align="center"  width="175"><input type="button" value="湲��벐湲�" onclick="window.location='/TeamProject/event/WriteForm.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="�씠踰ㅽ듃 諛붾줈媛�湲�" onclick="window.location='/TeamProject/event/cardlist.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >3</td>
    	<td align="center"  width="450">�썑湲� 寃뚯떆�뙋</td>
    	<td align="center"  width="175"></td>
    	<td align="center"  width="175"><input type="button" value="�썑湲� 諛붾줈媛�湲�" onclick="window.location='/TeamProject/latterBoard/imageList.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >4</td>
    	<td align="center"  width="450">1 : 1 臾몄쓽 寃뚯떆�뙋</td>
    	<td align="center"  width="175"><input type="button" value="湲��벐湲�" onclick="window.location='/TeamProject/CSBoard/csBoardWrite.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="臾몄쓽�궗�빆 諛붾줈媛�湲�" onclick="window.location='/TeamProject/CSBoard/csBoardList.jsp'"/></td>
	</tr>
    <tr height="30">
    	<td align="center"  width="75" >5</td>
    	<td align="center"  width="450">�옄二� 臾삳뒗 吏덈Ц 寃뚯떆�뙋</td>
    	<td align="center"  width="175"><input type="button" value="湲��벐湲�" onclick="window.location='/TeamProject/QABoard/qaBoardWrite.jsp'"/></td>
    	<td align="center"  width="175"><input type="button" value="�옄二� 臾삳뒗 吏덈Ц 諛붾줈媛�湲�" onclick="window.location='/TeamProject/QABoard/qaBoardList.jsp'"/></td>
	</tr>
	<tr height="30">
    	<td align="center"  width="75" >6</td>
    	<td align="center"  width="450">�삁�빟 寃뚯떆�뙋</td>
    	<td align="center"  width="175"></td>
    	<td align="center"  width="175"><input type="button" value="�삁�빟 諛붾줈媛�湲�" onclick="window.location='/TeamProject/Reserve/ReserveForm.jsp'"/></td>
	</tr>
</table>