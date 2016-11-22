<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<html>
<head>
<title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">
<%
session("nbigarea")=request("nbigarea")
session("nsmallarea")=request("nsmallarea")
session("ly")=request("ly")
session("key")=request("key")
if isempty(session("nsmallarea")) or isempty(session("nbigarea")) or isempty(session("key")) then
	nextok=0
else
	nextok=1
	response.redirect "edit.asp"
end if
%>
<fieldset>
<legend>请选择栏目分类：</legend>
<form id="form1" name="form1" method="get" action="#">
<table width="400" border="1" cellpadding="1" bordercolor="#999999">
<tr><td colspan="2">
    <select name="nbigarea">
		<%
		sql="select * from nbigarea"
		set rs=conn.execute(sql)
		while not rs.eof
		if rs("SMT_id")=cint(request("nbigarea")) then
			response.Write "<option value='"&rs("SMT_id")&"' selected='selected'>"&rs("nbigarea")&"</option>"
		else
			response.Write "<option value='"&rs("SMT_id")&"'>"&rs("nbigarea")&"</option>"
		end if
		rs.movenext
		wend
		%>
    </select>

	<%
	if not isempty(request("nbigarea")) then
	tmp=cint(request("nbigarea"))
	%>
    <select name="nsmallarea">
		<%
		sql="select * from nsmallarea where nbigarea="&tmp
		set rs=conn.execute(sql)
		while not rs.eof
		response.Write "<option value='"&rs("SMT_id")&"'>"&rs("nsmallarea")&"</option>"
		rs.movenext
		wend
		%>
    </select>
	<%end if%>
</td></tr>
<%if not (isempty(request("nbigarea")) or isempty(request("nsmallarea"))) then%>
<tr>
  <td>关键词：</td>
  <td><input name="key" type="text" size="40" value=""></td>
</tr>
<tr>
<td width="80">来源：</td>
<td width="304"><input name="ly" type="text" size="40" value=""></td>
</tr>
<%end if%>
<tr><td colspan="2" align="right">
    <input type="submit" name="Submit" value="提交" />
</td>
</tr>
</table>
</form>
</fieldset>
</body>
</html>
