<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>FileUpload Form</title>
</head>
<body>
<center>
<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">	
	<table border=1>
		<tr>
			<td colspan=2 align=center>
				<h3>파일 업로드 폼</h3>
			</td>
		</tr>
		<tr>
			<td>올린 사람 : </td>
			<td><input type="text" name="name"/></td>
		</tr>
		<tr>
			<td>제목 : </td>
			<td><input type="text" name="subject"/></td>
		</tr>
		<tr>
			<td>파일명1 : </td>
			<td><input type="file" name="fileName1"/></td>
		</tr>
		<tr>
			<td>파일명2 : </td>
			<td><input type="file" name="fileName2"/></td>
		</tr>
		<tr colspan=2 align=center>
			<td colspan=2 align=center>
			<input type="submit" value="전송"/>
			</td>
		</tr>
	</table>
</form>
</center>
</body>
</html>