<!--#include file="../inc/mdb.asp"-->
<!--#include file="../inc/inc.asp"-->
<html>
<head>
<title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">
<%
session("nbigarea")=request("nbigarea")
session("nsmallarea")=request("nsmallarea")

if isempty(session("nsmallarea")) or isempty(session("nbigarea")) then
	nextok=0
else
	nextok=1
	response.redirect "step3.asp"
end if
%>
<fieldset>
<legend>请选择栏目：</legend>
<form id="form1" name="form1" method="get" action="#">
    <select name="nbigarea">
		<%
		sql="select * from nbigarea"
		set rs=conn.execute(sql)
		while not rs.eof
		if rs("SMT_id")=cint(request("nbigarea")) then
			response.Write "<option value='"&rs("SMT_id")&"' selected='selected'>"&rs("nbigarea")&"</option>"
		else
			response.Write "<option value='"&rs("SMT_id")&"'>"&rs("nbigarea")&"</option>"
		end if		
		rs.movenext
		wend
		%>
    </select>

	<%
	if not isempty(request("nbigarea")) then
	tmp=cint(request("nbigarea"))
	%>

    <select name="nsmallarea">
		<%
		sql="select * from nsmallarea where nbigarea="&tmp
		set rs=conn.execute(sql)
		while not rs.eof
		response.Write "<option value='"&rs("SMT_id")&"'>"&rs("nsmallarea")&"</option>"
		rs.movenext
		wend
		%>
    </select>
	<%end if%>
    <input type="submit" name="Submit" value="提交" />
    <a href="step2_2.asp">&lt;-返回</a>
</form>
</fieldset>
</body>
</html>
