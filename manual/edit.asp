<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<HTML>
<HEAD>
<TITLE>�༭����</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</HEAD>
<BODY>
<%
ly=session("ly")
key=session("key")
nbigarea=session("nbigarea")
nsmallarea=session("nsmallarea")
addr=session("username")
%>
<FORM method="POST" name="myform" action="submit.asp">

<table width="660" border="1" cellpadding="1" bordercolor="#999999">
<tr>
  <TD>���⣺</TD>
  <TD colspan="3"><input name="title" type="text" size="40" value=""></TD>
<tr>
  <TD>��Դ��</TD>
  <TD colspan="3"><input name="ly" type="text" size="40" value="<%=ly%>"></TD>
<tr>
  <TD>�ؼ��ʣ�</TD>
  <TD colspan="3"><input name="key" type="text" size="40" value="<%=key%>"></TD>
</tr>
<tr>
  <TD>���ࣺ</TD>
  <TD width="191"><input name="nbigarea" type="text" size="4" value="<%=nbigarea%>"></TD>
  <TD width="76">С�ࣺ</TD>
  <TD width="305"><input name="nsmallarea" type="text" size="4" value="<%=nsmallarea%>"></TD>
</tr>
<tr>
	<TD width="60">���ݣ�</TD>
	<TD colspan="3"><INPUT type="hidden" name="content1" value="">
	  <IFRAME ID="eWebEditor1" src="../editor/ewebeditor.asp?id=content1&style=s_coolblue" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>	</TD>
</tr>
<TR>
	<TD colspan=4 align=right>
	<input name="addr" type="hidden" value="<%=addr%>">
	<INPUT type=submit name=b1 value="�ύ"> 
	<INPUT type=reset name=b2 value="����">	</TD>
</TR>
</TABLE>
</FORM>


</BODY>
</HTML>
