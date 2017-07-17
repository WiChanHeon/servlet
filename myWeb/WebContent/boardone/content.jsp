<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "boardone.BoardDAO" %>    
<%@page import = "boardone.BoardVO" %>    
<%@page import = "java.util.List" %>    
<%@page import = "java.text.SimpleDateFormat" %>

<%@ include file="view/color.jsp" %>   
<%
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	try{
		BoardDAO dbPro = BoardDAO.getInstance();
		BoardVO article = dbPro.getArticles(num);
		int ref = article.getRef();
		int step = article.getStep();
		int depth = article.getDepth();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body bgcolor="<%=bodyback_c%>">
<center><b>글내용 보기</b>
<br>
<form>
<table width="500" border="1" cellpadding="0" cellspacing="0" bgcolor="<%=bodyback_c%>" align="center">
<tr height="30">
	<td align="center" width="125" bgcolor="<%=value_c %>">
	글번호
	</td>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	<%=article.getNum() %>
	</td>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	조회수
	</td>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	<%=article.getReadcount() %>
	</td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="<%=value_c %>">
	작성자
	</td>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	<%=article.getWriter() %>
	</td>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	작성일
	</td>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	<%= sdf.format(article.getRegdate()) %>
	</td>
</tr>
<tr height="30">
	<td align="center" width="125" bgcolor="<%=value_c %>">
	글제목
	</td>
	<td align="center" width="375" bgcolor="<%=value_c %>" align="cetner" colspan="3">
	<%=article.getSubject() %>
	</td>
</tr>
<tr>
	<td align="center" width="125" bgcolor="<%=value_c %>">
	글내용
	</td>
	<td align="left" width="375" bgcolor="<%=value_c %>" colspan="3">
	<pre><%=article.getContent() %></pre>
	</td>
</tr>
<tr height="30">
	<td bgcolor="<%=value_c %>" align="right" colspan="4">
		<input type="button" value="글수정" onclick="document.location.href='updateForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="글삭제" onclick="document.location.href='deleteForm.jsp?num=<%=article.getNum()%>&pageNum=<%=pageNum%>'"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="답글쓰기" onclick="document.location.href='writeForm.jsp?num=<%=num%>&ref=<%=ref%>&step=<%=step%>&depth=<%=depth%>'"/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" value="글목록" onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"/>&nbsp;&nbsp;&nbsp;&nbsp;	
	</td>
</tr>
</table>
<%
	}catch(Exception e){}
%>
</form>
</center>
</body>
</html>