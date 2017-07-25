<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
	String origfilename1 = request.getParameter("origfilename1");
	String origfilename2 = request.getParameter("origfilename2");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>파일 업로드 확인 및 다운로드</title>
</head>
<body>
올린 사람 : <%=name%><br>
제목 : <%=subject%><br>
파일명1 : <a href="/myWeb/upload/<%=filename1%>"><%=origfilename1%></a><br>
파일명2 : <a href="/myWeb/upload/<%=filename2%>"><%=origfilename2%></a><br>
</body>
</html>