<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<%
id=clng(request("id"))
usertable=session("usertable")
if not isempty(id) then
	sql="delete from "&usertable&" where SMT_id="&id
	conn.execute(sql)
end if

response.Write "<script language='javascript'>"
response.Write "self.location='edit.asp?id="&id&"';"
response.Write "</script>"
%>