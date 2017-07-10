<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%@page import="java.util.*,memberone.*" %>
<%
	StudentDAO dao = StudentDAO.getInstance();
%>
<jsp:useBean id="vo" class="memberone.StudentVO"/>
<jsp:setProperty property="*" name="vo"/>
<%
	boolean flag = dao.memberInsert(vo);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입 확인</title>
</head>
<body bgcolor="#FFFFCC">
<br />
<center>
<%
if(flag){
	out.println("<b>회원 가입을 축하 드립니다.</b><br />");
	out.println("<a href=login.jsp>로그인</a>");
}else{
	out.println("<b>다시 입력하여 주십시오.</b><br />");
	out.println("<a href=regForm.jsp>다시 가입</a>");
}
	
%>
</center>
</body>
</html>