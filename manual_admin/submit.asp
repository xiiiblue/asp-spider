<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<%
' ����༭�����ݺܶ࣬�ϴ��ٶ�̫�������������µ�ʱ�䣬��λ��
'Server.ScriptTimeout = 600

For i = 1 To Request.Form("content1").Count 
	content = content & Request.Form("content1")(i) 
Next 
title=request.form("title")
ly=request.form("ly")
key=request.form("key")
addr=request.form("addr")
nbigarea=request.form("nbigarea")
nsmallarea=request.form("nsmallarea")
id=request.form("id")

if not isempty(id) then
	sql="update manual set SMT_title='"&title&"',SMT_ly='"&ly&"',SMT_addr='"&addr&"',keywords='"&key&"',nbigarea="&nbigarea&",nsmallarea="&nsmallarea&",SMT_news='"&content&"' where SMT_id="&id
	conn.execute(sql)
end if
%>
<script language="javascript">
	history.back()
</script>