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
<title>ID �ߺ�üũ</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<br>
<center>
<b><%=id%></b>
<%
	if(check){
		out.println("�� �̹� �����ϴ�  ID�Դϴ�<br></br>");
	}else{
		out.println("�� ��� ���� �մϴ�.<br></br>");
	}
%>
<a href="#" onclick="javascript:self.close()">�ݱ�</a>
</center>
</body>
</html>