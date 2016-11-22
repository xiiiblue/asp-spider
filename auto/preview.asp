<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/function.asp"-->
<%
on error resume next

userpath=session("userpath")
filepath="../uploadfile/"&userpath
filepath=server.MapPath(filepath)
titlemethod=session("titlemethod")		'标题提取方式，值为1时 提取<title>...</title>,并截取keyword0之前字段
										'值为2时 匹配keyword3,keyword4之间字段
										'值为3时 直接提取文件名
keyword0=stripspecial(session("keyword0"))
keyword1=stripspecial(session("keyword1"))	'正文内容匹配关键字
keyword2=stripspecial(session("keyword2"))
keyword3=stripspecial(session("keyword3"))	'标题匹配关键字
keyword4=stripspecial(session("keyword4"))
ly=stripcrlf(session("ly"))
username=stripcrlf(session("username"))
key=stripcrlf(session("key"))
smallarea=cint(session("smallarea"))
bigarea=cint(session("bigarea"))
%>

<%
'--------------FSO set-------------------------
list_from = filepath '储存当前源工作目录 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set Fold = fso.GetFolder(list_from) '获取Folder对象 
Set fc = Fold.Files '获取文件记录集 
Set mm = Fold.SubFolders '获取目录记录集
if isempty(session("isnext")) then
	session("isnext")=1
elseif request("isnext")="true" then
	session("isnext")=session("isnext")+1
	if session("isnext")>fc.count then
		session("isnext")=1
	end if
end if
flag2=0
For Each f1 in fc
	flag2=flag2+1
	file_from = list_from & "\" & f1.name '生成文件地址(源) 
	fileExt = lcase(right(f1.name,4)) '获取文件类型 
	If fileExt=".asp" or fileExt=".inc" or fileExt=".htm" or fileExt="html" Then '具体类型可自行修改添加 
		set objfile = server.createobject("scripting.filesystemobject") '定义一个服务器组件（读取源文件 
		set out = objfile.opentextfile(file_from, 1, false, false) 
		content = out.readall '读取数据 
		out.close 
'-------------------------------主过滤部分-------------------------------------------
		flag=0
		tmp_content=stripcrlf(content)			'去换行,特殊符号

		if titlemethod=1 then
			tmp_title= striptitle1(tmp_content)	'匹配<title>..</title>
		end if
		if titlemethod=2 then
			tmp_title=striptitle2(tmp_content)	'匹配keyword3,keyword4
		end if
		if titlemethod=3 then
			tmp_title=striptitle3()				'匹配文件名
		end if
		tmp_content=stripcontent(tmp_content)		
'------------------------------------------------------------------------------------					
	end if
	if flag2=session("isnext") then
		exit for
	end if
next


%>
<html>
<head><title>文章预览</title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<fieldset>
<legend>预览</legend>
<form action="#" method="get">
	<input type="hidden" name="isnext" value="true">
	<input type="submit" name="Submit" value="下一篇"><%=flag%>
</form>
<div class="title1">标题:</div><%=tmp_title%><br>
<div class="title1">录入者：</div><%=username%><br>
<div class="title1">关键字：</div><%=key%><br>
<div class="title1">来源：</div><%=ly%><br>
<div class="title1"></div>
<div class="title1">正文内容:</div>
<%=tmp_content%>
</fieldset>

</body>
</html>