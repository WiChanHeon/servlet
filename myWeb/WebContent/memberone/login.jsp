<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String loginID = (String)session.getAttribute("loginID");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body>
<% if(loginID != null){ %>
<table width="300" border="1">
	<tr>
		<td colspan="3" align="center">
		<%=loginID %>님 환영합니다.
		</td>
	</tr>
	<tr>
		<td align="center" width="100"><a href="modifyForm.jsp">정보수정</a></td>
		<td align="center" width="100"><a href="deleteForm.jsp">회원탈퇴</a></td>
		<td align="center" width="100"><a href="logout.jsp">로그아웃</a></td>
	</tr>
</table>
<%}else{ %>
<form action="loginProc.jsp" method="post">
<table width="300" border="1">
	<tr>
		<td colspan="2" align="center">회원 로그인</td>
	</tr>
	<tr>
		<td align="right" width="100">아이디 : </td>
		<td width="200">&nbsp;&nbsp;
		<input type="text" name="id" size="20"/></td>
	</tr>
	<tr>
		<td align="right" width="100">비번 : </td>
		<td width="200">&nbsp;&nbsp;
		<input type="password" name="pass" size="20"/></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="submit" value="로그인"/>
		<input type="button" value="회원가입" onClick="javascript:window.location='regForm.jsp'"/>
		</td>
	</tr>
</table>
<%}%>
</form>
</body>
</html>