<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import = "boardone.BoardDAO" %>    
<%@page import = "boardone.BoardVO" %>    
<%@page import = "java.util.List" %>    
<%@page import = "java.text.SimpleDateFormat" %>
<%@ include file="view/color.jsp" %>
<%
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
%>    
<%
	int count = 0;
	int number = 0;
	List<BoardVO> articleList = null;
	BoardDAO dbPro = BoardDAO.getInstance();
	count = dbPro.getArticleCount();//전체 글수
	if (count >0){
		articleList = dbPro.getArticles();
	}
	number = count;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
</head>
<body bgcolor="<%=bodyback_c%>">
<center><b>글목록(전체 글:<%=count%>)</b>
<table width="700">
<tr>
	<td align="right" bgcolor="<%=value_c %>">
	<a href="writeForm.jsp">글쓰기</a>
	</td>
</table>
<%
	if(count == 0){
%>
<table width="700" border="1" cellpadding="0" cellspacing="0">
<tr>
		<td align="center">
		게시판에 저장된 글이 없습니다.
		</td>
</table>
<%}else{ %>
<table border="1" width="700" cellpadding="0" cellspacing="0" align="center">
	<tr height="30" bgcolor="<%=value_c%>">
		<td align="center" width="50">번 호</td>
		<td align="center" width="250">제 목</td>
		<td align="center" width="100">작성자</td>
		<td align="center" width="150">작성일</td>
		<td align="center" width="50">조회</td>
		<td align="center" width="100">IP</td>
	</tr>
<%
	for(int i = 0 ; i < articleList.size() ; i++){
		BoardVO article = (BoardVO)articleList.get(i);
%>
	<tr height="30">
		<td align="center" width="50"><%= number-- %></td>
		<td width="250">
		<a href="content.jsp?num=<%=article.getNum()%>&pageNum=1">
			<%=article.getSubject() %></a>
			<% if(article.getReadcount()>=20){ %>
			<img src="images/hot.gif" border="0" height="16"/><%}%>
		</td>
		<td align="center" width="100"><a href="mailto:<%=article.getEmail()%>">
						<%=article.getWriter()%></a>
		</td>
		<td align="center" width="150">
						<%= sdf.format(article.getRegdate()) %>
		</td>
		<td align="center" width="50">
			<%=article.getReadcount() %>
		</td>
		<td align="center" width="100">
			<%=article.getIp() %>
		</td>
	</tr>
	<%} %>
</table>
<%} %>

</center>
</body>
</html>