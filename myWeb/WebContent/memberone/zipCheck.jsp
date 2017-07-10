<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*,memberone.*" %>
<%
	StudentDAO dao = StudentDAO.getInstance();
%>
<%
	request.setCharacterEncoding("UTF-8");
	String check = request.getParameter("check");
	String dong = request.getParameter("dong");
	Vector<ZipCodeVO> zipcodeList = dao.zipcodeRead(dong);
	int totalList = zipcodeList.size();
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>우편번호 검색</title>
<link rel="stylesheet" href="style.css" type="text/css"/>
<script src="script.js"></script>
</head>
<body bgcolor="#FFFFCC">
<center>
<b>우편번호 찾기</b>
<form action="zipCheck.jsp" name="zipForm" method="post">
<table>
	<tr>
		<td>동이름 입력 : <input name="dong" type="text">
		<input type="button" value="검색" onClick="dongCheck()"/>
		</td>
	</tr>
</table>
<input type="hidden" name="check" value="n"/>
</form>
<table>
<%
	if(check.equals("n")){
%>

<%
	if(zipcodeList.isEmpty()){
%>
	<tr>
		<td align="center"><br />검색된 결과가 없습니다.</td>
	</tr>
<% }
	else{
%>
	<tr>
		<td align="center"><br />%검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
	</tr>
<%
for(int i=0;i<totalList;i++){
	ZipCodeVO vo = zipcodeList.elementAt(i);
	String tempZipcode = vo.getZipcode();
	String tempSido = vo.getSido();
	String tempGugun = vo.getGugun();
	String tempDoro = vo.getDoro();
	String tempBdname = vo.getBdname();
	String tempDong = vo.getDong();
	String tempBunji1 = vo.getBunji1();
	String tempBunji2 = vo.getBunji2();
	if(tempDong == null) tempDong = "";
	if(tempBunji2 == null) tempBunji2 = "";
%>
<tr><td>
<a href="javascript:sendAddress('<%=tempZipcode%>','<%=tempSido%>','<%=tempGugun%>','<%=tempDoro%>','<%=tempBdname%>','<%=tempDong%>','<%=tempBunji1%>','<%=tempBunji2%>')">
		<%=tempZipcode%>&nbsp;<%=tempSido%>&nbsp;<%=tempGugun%>&nbsp;<%=tempDoro%>&nbsp;<%=tempBdname%>&nbsp;<%=tempDong%>&nbsp;<%=tempBunji1%>&nbsp;<%=tempBunji2%>&nbsp;</a><br/>
<%
 }//end for
}//end else
%>
<%} %>
</td></tr>
	<tr><td align="center">
		<a href="javascript:this.close();">닫기</a>
		</td>
	</tr>
</table>
</center>
</body>
</html>