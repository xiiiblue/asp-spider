<!--#include file="inc/mdb.asp"-->
<!--#include file="inc/md5.asp"-->
<%
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
Response.Write("<script language=javascript>alert('���ύ��·�����󣬽�ֹ��վ���ⲿ�ύ�����벻Ҫ�ҸĲ�����');this.location.href='http://www.mycolorzone.com/';</script>") 
response.end
end if

oldpass=request("oldpass")
userpass=request("userpass")
userpass2=request("userpass2")

if userpass<>userpass2 then
response.write"<SCRIPT language=JavaScript>alert(' �������벻һ�� �� �뷵�� ��' );"
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
	response.write"<SCRIPT language=JavaScript>alert(' ������������� �� �뷵�� ��' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if

response.write"<SCRIPT language=JavaScript>alert(' ������ĳɹ� �� �뷵�� ��' );"
response.write"javascript:history.go(-1)</SCRIPT>"
response.end

%>

