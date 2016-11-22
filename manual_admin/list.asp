<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/check.asp"-->
<!--#include file="../inc/mdb.asp"-->
<script language="JavaScript">
function resure(resureid1,resureid2)
{
	question = confirm("确定要删除吗？")
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
<legend>手动录入列表</legend>
<p class="readme">此表格显示您手动录入文章详细列表。<br>
点示文章标题可查看内容，点示“删除”可删除一条记录。</p>

<table width="100%" border="1" cellpadding="1" bordercolor="#999999">
<tr>
<td>ID</td><td>文章标题</td><td>录入时间<td>删除此条</td>
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
	response.write "<a href='javascript:resure("&rs("SMT_id")&","&ipage&")'>删除</a>"
	response.write "</td>"
	response.write "</tr>"
	rs.movenext
end if
next
%>
</table>
<p>
  <%if ipage<>1 then%>
  <a href="?page=1&groupid=<%=groupid%>">第一页</a>
  <a href="?page=<%=ipage-1%>&groupid=<%=groupid%>">上一页</a>
  <%end if%>
  <%if ipage<>rs.pagecount then%>
  <a href="?page=<%=ipage+1%>&groupid=<%=groupid%>">下一页</a>
  <a href="?page=<%=rs.pagecount%>&groupid=<%=groupid%>">最末页</a>
  <%end if%>

[共<%=rs.pagecount%>页,当前第<%=ipage%>页]</p>
</fieldset>
</body>
</html>