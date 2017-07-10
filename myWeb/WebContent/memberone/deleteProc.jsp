<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,memberone.*" %>
<%
	StudentDAO dao = StudentDAO.getInstance();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 탈퇴</title>
</head>
<%
	String id = (String)session.getAttribute("loginID");
	String pass = request.getParameter("pass");
	int check = dao.deleteMember(id, pass);
	if(check == 1){
		session.invalidate();
%>
<meta http-equiv="Refresh" content="3;url=login.jsp"/>
<body>
<center>
<font size="5" face="바탕체"><
회원 정보가 삭제 되었습니다.<br>
안녕히 가세요!<br>
3초 후에 로그인 페이지로 이동합니다.<br>
</font>
</center>
<%}else{%>
<script>
	alert('비밀번호가 맞지 않습니다.');
	history.go(-1);
</script>
<%}%>
</body>
</html>