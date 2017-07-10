<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="memberone.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%@page import="java.util.*,memberone.*" %>
<%
	StudentDAO dao = StudentDAO.getInstance();
%>
<jsp:useBean id="vo" class="memberone.StudentVO">
<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>
<%
	String loginID = (String)session.getAttribute("loginID");
	vo.setId(loginID);
	dao.updateMember(vo);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Process</title>
</head>
<meta http-equiv="Refresh" content="3;url=login.jsp"/>
<body>
<center>
<font size="5" face="바탕체">
입력하신 내용대로 <b>회원 정보가 수정 되었습니다.</b><br />3초후에 Login Page로 이동합니다.
</font>
</center>
</body>
</html>