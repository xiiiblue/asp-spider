<!--#include file="inc/mdb.asp"-->
<!--#include file="inc/md5.asp"-->
<%
server_v1=Cstr(Request.ServerVariables("HTTP_REFERER"))
server_v2=Cstr(Request.ServerVariables("SERVER_NAME"))
if mid(server_v1,8,len(server_v2))<>server_v2 then
Response.Write("<script language=javascript>alert('你提交的路径有误，禁止从站点外部提交数据请不要乱改参数！');this.location.href='http://www.mycolorzone.com/';</script>") 
response.end
end if

username=request("username")
userpass=request("userpass")
userpass2=request("userpass2")
userpath=username
usertable=username

if userpass<>userpass2 then
	response.write"<SCRIPT language=JavaScript>alert(' 两次密码不一致 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
if username<>"" and userpass<>"" and len(username)<12 and len(userpass)<12  then
	sql="select * from user where username='"&username&"'"
	set rs=conn.execute(sql)
	if rs.eof and rs.bof then
		path="uploadfile/"&username
		path=server.MapPath(path)
		Set fso = CreateObject("Scripting.FileSystemObject")
		if not fso.folderexists(path) then
			fso.createfolder path
		end if	
		sql="CREATE TABLE "&usertable&" (SMT_id int(10) NOT NULL auto_increment,SMT_yp_id int(11) default NULL,SMT_ly varchar(50) NOT NULL default '',SMT_addr varchar(50) NOT NULL default '',SMT_title varchar(50) NOT NULL default '',SMT_news text NOT NULL,SMT_date varchar(20) default NULL,SMT_key int(11) default NULL,SMT_key1 int(11) default NULL,SMT_key2 int(11) default NULL,SMT_key3 int(11) default NULL,SMT_enrol int(11) default NULL,SMT_htc int(11) default NULL,nsmallarea int(11) default NULL,nbigarea int(11) default NULL,keywords varchar(255) default NULL COMMENT '0',description varchar(255) default NULL COMMENT '0',PRIMARY KEY  (SMT_id)) ENGINE=MyISAM DEFAULT CHARSET=latin1"
		userpass=md5(userpass)
		conn.execute(sql)
		sql="insert into user (username,userpass,userpath,usertable) values ('"&username&"','"&userpass&"','"&username&"','"&username&"')"
		conn.execute(sql)
		response.write"<SCRIPT language=JavaScript>alert(' 注册成功，请登录 ！' );"
		response.write"url='index.asp';location.href=url;</script>"
		response.end
	else
		response.write"<SCRIPT language=JavaScript>alert(' 用户名己被注册 ， 请返回 ！' );"
		response.write"javascript:history.go(-1)</SCRIPT>"
		response.end
	end if
else
	response.write"<SCRIPT language=JavaScript>alert(' 输入不完整 ， 请返回 ！' );"
	response.write"javascript:history.go(-1)</SCRIPT>"
	response.end
end if
%>
