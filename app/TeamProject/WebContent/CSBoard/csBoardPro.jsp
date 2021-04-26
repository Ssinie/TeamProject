<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<title> Q&A 1:1 문의 게시판 </title>

<html>
<head>
    <style type="text/css">
        #title{
            height : 16;
            font-family :'돋움';
            font-size : 12;
            text-align :center;
        }
    </style>

</head>
<body>

    <br>
    <b><font size="5" color="lightblack"> Q&A</font></b>
    <br>
    
    <form method="post" action="csBoard" name="csBoardPro" enctype="multipart/form-data">
    <input type="hidden" name="cs_writer" value="${sessionScope.sessionID}">
    <table width="700" border="3" cellpadding="0" cellspacing="0" bordercolor="lightblack" align="center">
        <tr>
            <td id="title">작성자</td>
            <td>${sessionScope.sessionID}</td>
        </tr>
            <tr>
            <td id="title">
                제 목
            </td>
            <td>
                <input name="cs_subject" type="text" size="90" maxlength="100" value=""/>
            </td>
        </tr>
        <tr>
            <td id="title">
                내 용
            </td>
            <td>
                <textarea name="cs_content" cols="72" rows="20"></textarea>
            </td>
        </tr>
        <tr>
            <td id="title">
                파일첨부
            </td>
            <td>
                <input type="file" name="cs_file" />
            </td>
        </tr>

        <tr align="center" valign="middle">
            <td colspan="5">
                <input type="reset" value="작성취소" >
                <input type="submit" value="등록" >
                <input type="button" value="목록" >
            </td>
        </tr>
    </table>
    </form>

</body>
</html>