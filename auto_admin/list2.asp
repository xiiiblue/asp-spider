<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<script language="JavaScript">
function resure(resureid1,resureid2,resureid3)
{
	question = confirm("确定要删除吗？")
	if (question !="0")
	{
		window.location = "list2.asp?id=" + resureid1 + "&groupid=" + resureid2 + "&page=" + resureid3;
	}
}
</script>
<%
username=session("username")
userpath=session("userpath")
usertable=session("usertable")

if not isempty(request("groupid")) then
	groupid=request("groupid")
else
	response.Write("ERROR")
	response.End()
end if

if not isempty(request("id")) then
	id=clng(request("id"))
	sql="delete from "&usertable&" where SMT_id="&id
	conn.execute(sql)
end if

if not isempty(request("deleteid")) then	
	deleteid=clng(request("deleteid"))
	sql="delete from "&usertable&" where SMT_key3="&deleteid&" and SMT_key2="&groupid
	conn.execute(sql)
end if

%>
<%
sql="select * from "&usertable&" where SMT_key2="&groupid&" order by SMT_id desc"

set rs=server.createobject("adodb.recordset") 
Rs.CursorLocation = 3
rs.open sql,conn,1,2
rs.pagesize=20
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
<legend>祥细列表</legend>
<p class="readme">此表格显示您本次录入的文章详细列表。<br>
点示文章标题可查看内容，点示“删除”可删除一条记录。</p>
<p>删除所有完整度为 <a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=14">14</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=13">13</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=12">12</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=11">11</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=10">10</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=9">9</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=14">8</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=7">7</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=6">6</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=5">5</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=4">4</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=3">3</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=2">2</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=1">1</a>
<a href="?page=<%=ipage%>&groupid=<%=groupid%>&deleteid=0">0</a></p>
<table width="100%" border="1" cellpadding="1" bordercolor="#999999">
<tr>
<td>ID</td><td>文章标题</td><td>完整度</td><td>状态</td><td>删除此条</td>
</tr>
<%
for i=1 to rs.pagesize
if not rs.eof then
	response.write "<tr>"
	response.write "<td>"
	response.write rs("SMT_id")
	response.write "</td>"
	response.write "<td>"
	response.write "<a href='edit.asp?id="&rs("SMT_id")&"'><xmp>"&rs("SMT_title")&"</xmp></a>"
	response.write "</td>"
	response.write "<td>"
	response.write(rs("SMT_key3"))
	response.write "</td>"
	response.write "<td>"
	if rs("SMT_key1")=1 then
		response.write "<font color='green'>己编辑</font>"
	else
		response.write "<font color='red'>未编辑</font>"
	end if
	response.write "</td>"
	response.write "<td>"
	response.write "<a href='javascript:resure("&rs("SMT_id")&","&groupid&","&ipage&")'>删除</a>"
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