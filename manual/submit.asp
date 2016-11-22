<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<%
'Server.ScriptTimeout = 600

For i = 1 To Request.Form("content1").Count 
	content = content & Request.Form("content1")(i) 
Next 
title=request.form("title")
ly=request.form("ly")
key=request.form("key")
addr=request.form("addr")
nbigarea=cint(request.form("nbigarea"))
nsmallarea=cint(request.form("nsmallarea"))

if content="" then
	response.write"<SCRIPT language=JavaScript>alert(' ÄÚÈİÎ´ÌîĞ´ £¬ Çë·µ»Ø £¡' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if nbigarea="" then
	response.write"<SCRIPT language=JavaScript>alert(' ´óÀàÎ´ÌîĞ´ £¬ Çë·µ»Ø £¡' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if nsmallarea="" then
	response.write"<SCRIPT language=JavaScript>alert(' Ğ¡ÀàÎ´ÌîĞ´ £¬ Çë·µ»Ø £¡' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if ly="" then
	response.write"<SCRIPT language=JavaScript>alert(' À´Ô´Î´ÌîĞ´ £¬ Çë·µ»Ø £¡' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if key="" then
	response.write"<SCRIPT language=JavaScript>alert(' ¹Ø¼ü´ÊÎ´ÌîĞ´ £¬ Çë·µ»Ø £¡' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if session("username")="" or session("usertable")="" or session("usertable")="" then
	response.write"<SCRIPT language=JavaScript>alert(' Î´µÇÂ¼ £¬ Çë·µ»Ø £¡' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if


sql="insert into manual (SMT_title,SMT_news,SMT_ly,SMT_addr,SMT_date,keywords,nsmallarea,nbigarea) values ('"&title&"','"&content&"','"&ly&"','"&addr&"','"&now()&"','"&key&"',"&nsmallarea&","&nbigarea&")"
conn.execute(sql)
%>
<script language="javascript">
	window.location="edit.asp";
</script>