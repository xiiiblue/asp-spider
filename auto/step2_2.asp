<!--#include file="../inc/inc.asp"-->
<html>
<head>
<title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">
<%
if not (isempty(request("keyword1")) or isempty(request("keyword2")) or isempty(request("ly")) or isempty(request("key"))) then
	if  request("keyword1")="" or request("keyword2")="" or request("ly")="" or request("key")=""then
		response.write"<SCRIPT language=JavaScript>alert(' 请填写完整 ！' );</script>"
	else
		session("keyword1")=request("keyword1")
		session("keyword2")=request("keyword2")
		session("ly")=request("ly")
		session("key")=request("key")
		response.redirect "step2_3.asp"
	end if
end if
%>
<fieldset>
<legend>正文提取方式：</legend>
<br>
<div class="readme">请输入正文前后的标识，正确与否直接影响过滤效果，请认真填写！！</div>
<form id="form1" name="form1" method="get" action="#">
  <table width="660" border="1" cellpadding="1" bordercolor="#999999">
    <tr>
      <td>正文关键字A：</td>
      <td>
	  	<input type="text" name="keyword1"><br>
	  	<xmp><%=session("keyword1")%></xmp>
	  </td>
    </tr>
    <tr>
      <td>正文关键字B：</td>
      <td>
	  	<input type="text" name="keyword2"><br>
		<xmp><%=session("keyword2")%></xmp>
	  </td>
    </tr>
	<tr>
      <td>出处：</td>
      <td><input name="ly" type="text" value="<%=session("ly")%>" maxlength="24"></td>
    </tr>
	<tr>
      <td>关键词：</td>
      <td><input name="key" type="text" value="<%=session("key")%>" maxlength="24"></td>
    </tr>
  </table>
    <input type="submit" name="Submit" value="提交" />
    <a href="step2_1.asp">&lt;-返回</a>
</form>
</fieldset>
</body>
</html>
