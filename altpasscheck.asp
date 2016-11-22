<!--#include file="inc/mdb.asp"-->
<!--#include file="inc/md5.asp"-->
<%
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
Response.Write("<script language=javascript>alert('你提交的路径有误，禁止从站点外部提交数据请不要乱改参数！');this.location.href='http://www.mycolorzone.com/';</script>") 
response.end
end if

oldpass=request("oldpass")
userpass=request("userpass")
userpass2=request("userpass2")

if userpass<>userpass2 then
response.write"<SCRIPT language=JavaScript>alert(' 两次密码不一致 ， 请返回 ！' );"
response.write"javascript:history.go(-1)</SCRIPT>"
response.end
end if

sql="select * from user where username='"&session("username")&"'"
set rs=conn.execute(sql)
pass=rs("userpass")

if md5(oldpass)=pass then
	sql="update user set userpass='"&md5(userpass)&"' where username='"&session("username")&"'"
	conn.execute(sql)
else
	response.write"<SCRIPT language=JavaScript>alert(' 旧密码输入错误 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if

response.write"<SCRIPT language=JavaScript>alert(' 密码更改成功 ， 请返回 ！' );"
response.write"javascript:history.go(-1)</SCRIPT>"
response.end

%>

