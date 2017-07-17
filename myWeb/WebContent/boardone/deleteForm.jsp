<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="view/color.jsp" %>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<script language="JavaScript">
	/* function deleteSave(){
		if(document.delForm.pass.value==""){
			alert('비밀번호를 입력하세용.');
			document.delForm.pass.focus();
			return false;
		}
	} */
</script>
</head>
<body bgclolor="<%=bodyback_c%>">
<center><b>글삭제</b>
<br />
<form action="deleteProc.jsp?pageNum=<%=pageNum%>" method="post" name="delForm" onsubmit="return deleteSave()">
<table border="1" align="center" cellspacing="0" cellpadding="0" width="360">
<tr height="30">
	<td align="center" bgclolor="<%=value_c%>">
		<b>비밀번호를 입력해 주세요.</b>
	</td>	
</tr>
<tr height="30">
	<td align="center">
		<input type="password" name="pass" size="8" maxlength="12"/>
		<input type="hidden" name="num" value="<%=num%>"/></td>
</tr>
<tr height="30">
	<td align="center" bgclolor="<%=value_c%>">
		<input type="submit" value="글삭제"/>
		<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"/></td>
</tr>	
</table>
</form>
</center>

</body>
</html>