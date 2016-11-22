<!--#include file="inc/mdb.asp"-->
<!--#include file="inc/md5.asp"-->
<%
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
Response.Write("<script language=javascript>alert('你提交的路径有误，禁止从站点外部提交数据请不要乱改参数！');this.location.href='http://www.mycolorzone.com/';</script>") 
response.end
end if

CheckCode=replace(trim(Request("CheckCode")),"'","")
if session("CheckCode")="" then
	response.write"<SCRIPT language=JavaScript>alert(' 未填写验证码 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if CheckCode<>CStr(session("CheckCode")) then
	response.write"<SCRIPT language=JavaScript>alert(' 验证码错误 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if


dim sql,rs
dim username,userpass,gourl
username=request("username")
userpass=request("userpass")

if username="" or len(username)>12 then
CheckCode=replace(trim(Request("CheckCode")),"'","")

end if
if userpass="" or len(userpass)>12 then
	response.write"<SCRIPT language=JavaScript>alert(' 密码为空或错误 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if

userpass=md5(userpass)

set rs=server.createobject("adodb.recordset")
sql="select * from user where username='" & username & "' and userpass='" & userpass &"'"
rs.open sql,conn,1,3
if rs.bof and rs.eof then
	response.write"<SCRIPT language=JavaScript>alert('你输入的用户名或密码错误 ，请返回 ！');"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
else
'	rs("LastLoginIP")=Request.ServerVariables("REMOTE_ADDR")
'	rs("LastLoginTime")=now()
'	rs("LoginTimes")=rs("LoginTimes")+1
'	rs.update
	session("username")=rs("username")
	session("userpass")=request("userpass")
	session("userpath")=rs("userpath")
	session("usertable")=rs("usertable")
	session("login")=1
	response.Redirect("default.asp")
end if
rs.close
set rs=nothing

%>
