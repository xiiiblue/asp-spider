<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<%
id=clng(request("id"))
usertable=session("usertable")
if not isempty(id) then
	sql="select * from "&usertable&" where SMT_id="&id
	set rs=conn.execute(sql)
end if

nbigarea=rs("nbigarea")
nsmallarea=rs("nsmallarea")

sql="select * from nbigarea where SMT_id="&nbigarea
set rs=conn.execute(sql)
Name_nbigarea=rs("nbigarea")

sql="select * from nsmallarea where SMT_id="&nsmallarea
set rs=conn.execute(sql)
Name_nsmallarea=rs("nsmallarea")
%>

<%
New_nbigarea=cint(request("New_nbigarea"))
New_nsmallarea=cint(request("New_nsmallarea"))
if not (isempty(request("id")) or isempty(request("New_nsmallarea")) or isempty(request("New_nbigarea"))) then
	sql="update "&usertable&" set nbigarea="&New_nbigarea&",nsmallarea="&New_nsmallarea&" where SMT_id="&id
	conn.execute(sql)
response.Write "<script language='javascript'>"
response.Write "self.location='edit.asp?id="&id&"';"
response.Write "</script>"
end if


%>

<HTML>
<HEAD>
<TITLE>编辑窗口</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<form id="form1" name="form1" method="get" action="#">
<table width="400" border="1" cellpadding="1" bordercolor="#999999">
<tr>
  <td>当前大类：<%=Name_nbigarea%></td>
  <td>当前小类：<%=Name_nsmallarea%></td>
</tr>
<tr><td>新的大类：
    <select name="New_nbigarea">
		<%
		sql="select * from nbigarea"
		set rs=conn.execute(sql)
		while not rs.eof
		if rs("SMT_id")=cint(request("New_nbigarea")) then
			response.Write "<option value='"&rs("SMT_id")&"' selected='selected'>"&rs("nbigarea")&"</option>"
		else
			response.Write "<option value='"&rs("SMT_id")&"'>"&rs("nbigarea")&"</option>"
		end if
		rs.movenext
		wend
		%>
    </select>
</td>
<td>新的小类：
	<%
	if not isempty(request("New_nbigarea")) then
	tmp=cint(request("New_nbigarea"))
	%>
    <select name="New_nsmallarea">
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
<tr><td colspan="2" align="right">
	<input type="hidden" name="id" value="<%=id%>"/>
    <input type="submit" name="" value="提交" />
	<input name="button" type="button" onClick="self.location='edit.asp?id=<%=id%>'" value="返回" >
</td></tr>
</table>
</form>
</BODY>
</HTML>
