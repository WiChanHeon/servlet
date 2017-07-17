<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "boardone.BoardDAO" %>    
<%@page import = "boardone.BoardVO" %>
<%@ include file="view/color.jsp" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<script src="script.js">
</script>
</head>
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	try{
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.updateGetArticle(num);
%>
<body bgcolor="<%=bodyback_c%>">
<center><b>글수정</b><br /></center>
<form action="updateProc.jsp?pageNum=<%=pageNum%>" method="post" name="writeForm" onsubmit="return writeSave()">
<table width="400" border="1" cellpadding="0" cellspacing="0" align="center" bgcolor="<%=bodyback_c %>">
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">이름</td>
		<td align="left" width="330">
			<input type="text" size="10" maxlength="10" name="writer" value="<%=article.getWriter()%>"/>
			<input type="hidden" name="num" value="<%=article.getNum()%>"/>
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">제 목</td>
		<td align="left" width="330">
			<input type="text" size="40" maxlength="50" name="subject" value="<%=article.getSubject()%>"/>
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
		<td align="left" width="330">
			<input type="text" size="40" maxlength="30" name="email" value="<%=article.getEmail()%>"/>
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">내 용</td>
		<td align="left" width="330">
			<textarea name="content" id="" cols="40" rows="13"><%=article.getContent()%></textarea>
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
		<td align="left" width="330">
			<input type="password" size="8" maxlength="12" name="pass"/>
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="<%=value_c %> align="center">
			<input type="submit" value="글쓰기"/>
			<input type="reset" value="다시작성"/>
			<input type="button" value="목록" onClick="window.location='list.jsp?pageNum=<%=pageNum%>'"/>
		</td>
	</tr>
</table>
</form>
</center>
<!-- 예외처리 -->
<%}catch(Exception e){} %>
</body>
</html>