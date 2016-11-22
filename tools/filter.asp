<%Response.Buffer=false%>
<!--#include file="../inc/mdb.asp"-->
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
</head>

<body>
<%
Function stripsql(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True 
  objRegExp.Pattern = "<|>"
  strOutput = objRegExp.Replace(strHTML, "")
  stripsql = strOutput
  Set objRegExp = Nothing
End Function

sql="select SMT_id from h000"
set rs=conn.execute(sql)
do while not rs.eof
	id=rs("SMT_id")
	
	sql="select * from h000 where SMT_id="&id
	set rs2=conn.execute(sql)
	title=rs2("SMT_title")
	title=stripsql(title)
	sql="update h000 set SMT_title='"&title&"' where SMT_id="&id
	response.Write(title)
	conn.execute(sql)
	
	rs.movenext()
loop
%>
</body>
</html>
