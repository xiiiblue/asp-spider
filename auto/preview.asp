<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/function.asp"-->
<%
on error resume next

userpath=session("userpath")
filepath="../uploadfile/"&userpath
filepath=server.MapPath(filepath)
titlemethod=session("titlemethod")		'������ȡ��ʽ��ֵΪ1ʱ ��ȡ<title>...</title>,����ȡkeyword0֮ǰ�ֶ�
										'ֵΪ2ʱ ƥ��keyword3,keyword4֮���ֶ�
										'ֵΪ3ʱ ֱ����ȡ�ļ���
keyword0=stripspecial(session("keyword0"))
keyword1=stripspecial(session("keyword1"))	'��������ƥ��ؼ���
keyword2=stripspecial(session("keyword2"))
keyword3=stripspecial(session("keyword3"))	'����ƥ��ؼ���
keyword4=stripspecial(session("keyword4"))
ly=stripcrlf(session("ly"))
username=stripcrlf(session("username"))
key=stripcrlf(session("key"))
smallarea=cint(session("smallarea"))
bigarea=cint(session("bigarea"))
%>

<%
'--------------FSO set-------------------------
list_from = filepath '���浱ǰԴ����Ŀ¼ 
Set fso = CreateObject("Scripting.FileSystemObject") 
Set Fold = fso.GetFolder(list_from) '��ȡFolder���� 
Set fc = Fold.Files '��ȡ�ļ���¼�� 
Set mm = Fold.SubFolders '��ȡĿ¼��¼��
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
	file_from = list_from & "\" & f1.name '�����ļ���ַ(Դ) 
	fileExt = lcase(right(f1.name,4)) '��ȡ�ļ����� 
	If fileExt=".asp" or fileExt=".inc" or fileExt=".htm" or fileExt="html" Then '�������Ϳ������޸���� 
		set objfile = server.createobject("scripting.filesystemobject") '����һ���������������ȡԴ�ļ� 
		set out = objfile.opentextfile(file_from, 1, false, false) 
		content = out.readall '��ȡ���� 
		out.close 
'-------------------------------�����˲���-------------------------------------------
		flag=0
		tmp_content=stripcrlf(content)			'ȥ����,�������

		if titlemethod=1 then
			tmp_title= striptitle1(tmp_content)	'ƥ��<title>..</title>
		end if
		if titlemethod=2 then
			tmp_title=striptitle2(tmp_content)	'ƥ��keyword3,keyword4
		end if
		if titlemethod=3 then
			tmp_title=striptitle3()				'ƥ���ļ���
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
<head><title>����Ԥ��</title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<fieldset>
<legend>Ԥ��</legend>
<form action="#" method="get">
	<input type="hidden" name="isnext" value="true">
	<input type="submit" name="Submit" value="��һƪ"><%=flag%>
</form>
<div class="title1">����:</div><%=tmp_title%><br>
<div class="title1">¼���ߣ�</div><%=username%><br>
<div class="title1">�ؼ��֣�</div><%=key%><br>
<div class="title1">��Դ��</div><%=ly%><br>
<div class="title1"></div>
<div class="title1">��������:</div>
<%=tmp_content%>
</fieldset>

</body>
</html>