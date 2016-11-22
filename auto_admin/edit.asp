<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/function.asp"-->
<HTML>
<HEAD>
<TITLE>编辑窗口</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<p>
  <%
usertable=session("usertable")
id=clng(request("id"))

sql="select max(SMT_id) from "&usertable
set rs=conn.execute(sql)
maxid=rs(0)

sql="select min(SMT_id) from "&usertable
set rs=conn.execute(sql)
minid=rs(0)


if id>minid then
	preid=id
	do while true
		preid=preid-1
		sql="select * from "&usertable&" where SMT_id="&preid
		set rs=conn.execute(sql)
		if not (rs.eof and rs.bof) then
			exit do
		end if
	loop
else
	preid=id
end if

if maxid>id then
	nextid=id
	do while true
		nextid=nextid+1
		sql="select * from "&usertable&" where SMT_id="&nextid
		set rs=conn.execute(sql)
		if not (rs.eof and rs.bof) then
			exit do
		end if
	loop
else
	nextid=id
end if
%>

<table border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><input name="button" type="button" onClick="self.location='?id=<%=preid%>'" value="上一篇" ></td>
    <td valign="top"><input name="button2" type="button" onClick="self.location='?id=<%=nextid%>'" value="下一篇" ></td>
    <td valign="top"><input name="button3" type="button" onClick="self.location='delete.asp?id=<%=id%>'" value="删除此条" ></td>
	<td valign="top"><input name="button4" type="button" onClick="self.location='class.asp?id=<%=id%>'" value="更改分类" ></td>
    <td><FORM method="get" name="jump" action="">
  ID:<input name="id" type="text" size="4" value="<%=id%>">
  <input type="submit" value="跳到">
</form></td>
  </tr>
</table>
<%
usertable=session("usertable")
sql="select * from "&usertable&" where SMT_id="&id
set rs=conn.execute(sql)
if (rs.eof or rs.bof) then
	response.write "此条己删除！！"
	response.end
end if

nbigarea=cint(rs("nbigarea"))
nsmallarea=cint(rs("nsmallarea"))
addr=session("username")
%>
<FORM method="POST" name="myform" action="submit.asp">
<table width="660" border="1" cellpadding="1" bordercolor="#999999">
<tr>
  <TD>标题：</TD>
  <TD><input name="title" type="text" size="40" value="<%=rs("SMT_title")%>"></TD>
</tr>

<tr>
  <TD>来源：</TD>
  <TD><input name="ly" type="text" size="40" value="<%=rs("SMT_ly")%>"></TD>
</tr>
<tr>
  <TD>关键词：</TD>
  <TD><input name="key" type="text" size="40" value="<%=rs("keywords")%>"></TD>
</tr>
<tr>
  <TD>状态：</TD>
  <TD>
  	<%
	if rs("SMT_key1")=1 then
		response.write("<font color='green'>己编辑</font>")  
  	else
		response.write("<font color='red'>未编辑</font>")
	end if
	%>
	ID:<%=id%>&nbsp;完整度：<%=rs("SMT_key3")%>&nbsp;
  </TD>
</tr>
<tr>
	<TD width="100">编缉内容：</TD>
	<TD><INPUT type="hidden" name="content1" value="<%=stripeditor(rs("SMT_news"))%>">
	  <IFRAME ID="eWebEditor1" src="../editor/ewebeditor.asp?id=content1&style=s_coolblue" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>	</TD>
</tr>
<TR>
	<TD colspan=2 align=right>
	<input name="nbigarea" type="hidden" value="<%=nbigarea%>">
	<input name="nsmallarea" type="hidden" value="<%=nsmallarea%>">
	<input name="addr" type="hidden" value="<%=addr%>">
	<input name="id" type="hidden" value="<%=id%>">
	<INPUT type=submit name=b1 value="提交"> 
	<INPUT type=reset name=b2 value="重填"> 
	</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
