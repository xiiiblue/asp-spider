<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<script language="JavaScript">
function resure(resureid1,resureid2)
{
	question = confirm("ȷ��Ҫɾ����")
	if (question !="0")
	{
		window.location = "list.asp?id=" + resureid1 + "&page=" + resureid2;
	}
}
</script>
<%
username=session("username")

if not isempty(request("id")) then
	id=cint(request("id"))
	sql="delete from manual where SMT_id="&id
	conn.execute(sql)
end if
%>
<%
sql="select * from manual where SMT_addr='"&username&"' order by SMT_id desc"

set rs=server.createobject("adodb.recordset") 
Rs.CursorLocation = 3
rs.open sql,conn,1,2
rs.pagesize=10
if request("page").count>0 then
	ipage=cint(request("page"))
	if ipage<1 then
		ipage=1
	elseif ipage>rs.pagecount then
		ipage=rs.pagecount
	end if
else
	ipage=1
end if
rs.absolutepage=ipage
%>
<html>
<head><title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body>
<fieldset>
<legend>�ֶ�¼���б�</legend>
<p class="readme">�˱����ʾ���ֶ�¼��������ϸ�б�<br>
��ʾ���±���ɲ鿴���ݣ���ʾ��ɾ������ɾ��һ����¼��</p>

<table width="100%" border="1" cellpadding="1" bordercolor="#999999">
<tr>
<td>ID</td><td>���±���</td><td>¼��ʱ��<td>ɾ������</td>
</tr>
<%
for i=1 to rs.pagesize
if not rs.eof then
	response.write "<tr>"
	response.write "<td>"
	response.write rs("SMT_id")
	response.write "</td>"
	response.write "<td>"
	response.write "<a href='edit.asp?id="&rs("SMT_id")&"&page="&ipage&"'><xmp>"&rs("SMT_title")&"</xmp></a>"
	response.write "</td>"
	response.write "<td>"
	response.write(rs("SMT_date"))
	response.write "</td>"
	response.write "<td>"
	response.write "<a href='javascript:resure("&rs("SMT_id")&","&ipage&")'>ɾ��</a>"
	response.write "</td>"
	response.write "</tr>"
	rs.movenext
end if
next
%>
</table>
<p>
  <%if ipage<>1 then%>
  <a href="?page=1&groupid=<%=groupid%>">��һҳ</a>
  <a href="?page=<%=ipage-1%>&groupid=<%=groupid%>">��һҳ</a>
  <%end if%>
  <%if ipage<>rs.pagecount then%>
  <a href="?page=<%=ipage+1%>&groupid=<%=groupid%>">��һҳ</a>
  <a href="?page=<%=rs.pagecount%>&groupid=<%=groupid%>">��ĩҳ</a>
  <%end if%>

[��<%=rs.pagecount%>ҳ,��ǰ��<%=ipage%>ҳ]</p>
</fieldset>
</body>
</html>