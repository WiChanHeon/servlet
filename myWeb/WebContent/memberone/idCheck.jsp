<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="java.util.*,memberone.*" %>
<%
	StudentDAO dao = StudentDAO.getInstance();
%>

<%
	String id = request.getParameter("id");
	boolean check = dao.idCheck(id);
%>
<html>
<head>
<title>ID 중복체크</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<br>
<center>
<b><%=id%></b>
<%
	if(check){
		out.println("는 이미 존재하는  ID입니다<br></br>");
	}else{
		out.println("는 사용 가능 합니다.<br></br>");
	}
%>
<a href="#" onclick="javascript:self.close()">닫기</a>
</center>
</body>
</html>