<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/function.asp"-->
<%
'Server.ScriptTimeout = 600

Dim content, i
For i = 1 To Request.Form("content1").Count 
	content = content & Request.Form("content1")(i) 
Next 
title=request.form("title")
ly=request.form("ly")
key=request.form("key")
addr=request.form("addr")
nbigarea=cint(request.form("nbigarea"))
nsmallarea=cint(request.form("nsmallarea"))
usertable=session("usertable")
id=clng(request.form("id"))

title=stripsql(title)
content=stripsql(content)

if not isempty(id) then
	sql="update "&usertable&" set SMT_title='"&title&"',SMT_ly='"&ly&"',SMT_addr='"&addr&"',keywords='"&key&"',nbigarea="&nbigarea&",nsmallarea="&nsmallarea&",SMT_news='"&content&"',SMT_key1=1 where SMT_id="&id
	conn.execute(sql)
end if

response.Write "<script language='javascript'>"
response.Write "self.location='edit.asp?id="&id&"';"
response.Write "</script>"
%>