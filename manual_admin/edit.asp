<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<HTML>
<HEAD>
<TITLE>编辑窗口</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<%
id=request("id")
sql="select * from manual where SMT_id="&id
set rs=conn.execute(sql)
title=rs("SMT_title")
addr=rs("SMT_addr")
key=rs("keywords")
ly=rs("SMT_ly")
nbigarea=rs("nbigarea")
nsmallarea=rs("nsmallarea")
%>
<FORM method="POST" name="myform" action="submit.asp">
<table width="100%" border="1" cellpadding="1" bordercolor="#999999">
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
  <TD>大类：</TD>
  <TD><%=nbigarea%></TD>
</tr>
<tr>
  <TD>小类：</TD>
  <TD><%=nsmallarea%></TD>
</tr>
<tr>
	<TD width="100">编缉内容：</TD>
	<TD><INPUT type="hidden" name="content1" value="<%=rs("SMT_news")%>">
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
	<INPUT type=button name=b3 value="返回"  onClick="self.location='list.asp?id=<%=id%>&page=<%=request("page")%>'">
	</TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>
