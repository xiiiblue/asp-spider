<!--#include file="../inc/inc.asp"-->
<!--#include file="../inc/mdb.asp"-->
<script language="JavaScript">
function resure(resureid1,resureid2)
{
	question = confirm("确定要批量删除吗？")
	if (question !="0")
	{
		window.location = "list1.asp?groupid=" + resureid1 + "&page=" + resureid2;
	}
}
</script>
<%
username=session("username")
userpath=session("userpath")
usertable=session("usertable")



if not isempty(request("groupid")) then	
	groupid=clng(request("groupid"))
	sql="delete from "&usertable&" where SMT_key2="&groupid
	conn.execute(sql)
end if
%>


<%
sql="select count(SMT_id) as number,SMT_key2,SMT_date,nbigarea,nsmallarea from "&usertable&" group by SMT_key2 order by SMT_id desc"
set rs=server.createobject("adodb.recordset") 
Rs.CursorLocation = 3
rs.open sql,conn,1,2
if not rs.eof then
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
end if
%>

<html>
<head><title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body>

<fieldset>
<legend>批次列表</legend>
<p class="readme">此表格显示您的录入批次，您可以批量删除某一次录入的文章。 <br> 
点示“详细列表”可显示查看文章列表，删除特定某篇文章。<br>
删除后不可还原，请谨慎选择！！！</p>
<table width="100%" border="1" cellpadding="1" bordercolor="#999999">
<tr>
<td>详细列表</td><td>上传时间</td><td>上传条数</td><td>大类</td><td>小类</td><td>全部删除</td>
</tr>
<%
for i=1 to rs.pagesize
if not rs.eof then
	sql="select * from nbigarea where SMT_id="&rs("nbigarea")
	set rs2=conn.execute(sql)
	Name_nbigarea=rs2("nbigarea")
	sql="select * from nsmallarea where SMT_id="&rs("nsmallarea")
	set rs2=conn.execute(sql)
	Name_nsmallarea=rs2("nsmallarea")

	response.write "<tr>"
	response.write "<td>"
	response.write "<a href='list2.asp?groupid="&rs("SMT_key2")&"'>"&rs("SMT_key2")&"</a>"
	response.write "</td>"
	response.write "<td>"
	response.write rs("SMT_date")
	response.write "</td>"
	response.write "<td>"
	response.write rs("number")
	response.write "</td>"
	response.write "<td>"
	response.write (Name_nbigarea)
	response.write "</td>"
	response.write "<td>"
	response.write (Name_nsmallarea)
	response.write "</td>"
	response.write "<td>"
	'response.write "<a href='?groupid="&rs("SMT_key2")&"'>删除</a>"
	response.write "<a href='javascript:resure("&rs("SMT_key2")&","&ipage&")'>删除</a>"
	response.write "</td>"
	response.write "</tr>"
	rs.movenext
end if
next
%>
</table>
<%if ipage<>1 then%>
<a href="?page=1">第一页</a>
<a href="?page=<%=ipage-1%>">上一页</a>
<%end if%>
<%if ipage<>rs.pagecount then%>
<a href="?page=<%=ipage+1%>">下一页</a>
<a href="?page=<%=rs.pagecount%>">最末页</a>
<%end if%>
[共<%=rs.pagecount%>页,当前第<%=ipage%>页]
</fieldset>
</body>
</html>