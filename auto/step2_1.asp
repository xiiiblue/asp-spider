<!--#include file="../inc/inc.asp"-->
<html>
<head><title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">
<%
Function stripcrlf(strHTML)
  Dim objRegExp, strOutput
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True 
  objRegExp.Pattern = "\s"
  strOutput = objRegExp.Replace(strHTML, "")
  strOutput=replace(strOutput,"'","��")
  stripcrlf = strOutput
  Set objRegExp = Nothing
End Function
sub fail()
	response.write"<SCRIPT language=JavaScript>alert(' ����д���� ��' );</script>"
end sub
sub success()
	nextok=1
	response.redirect "step2_2.asp"
end sub
%>
<%
if not isempty(request("titlemethod")) then
	session("titlemethod")=cint(request("titlemethod"))
end if
if not isempty(request("titlemethod")) then
	session("keyword0")=request("keyword0")
end if
if not isempty(request("titlemethod")) then
	session("keyword3")=request("keyword3")
end if
if not isempty(request("titlemethod")) then
	session("keyword4")=request("keyword4")
end if

titlemethod=cint(request("titlemethod"))
keyword0=request("keyword0")
keyword3=request("keyword3")
keyword4=request("keyword4")
if isempty(titlemethod) then
	fail()
else
	if titlemethod=1 then
		if  keyword0="" then
			fail()
		else
			success()
		end if
	elseif titlemethod=2 then
		if keyword3="" or keyword4=""then
			fail()
		else
			success()
		end if
	elseif titlemethod=3 then
		success()
	end if
end if
%>
<fieldset>
<legend>������ȡ��ʽ��</legend>
<br>
<div class="readme">ע�⣬���ѡ��ʽ1���ָ���һ��Ϊ��-��</div>
<br>
<form name="form1" method="get" action="">
  <table width="660" border="1" cellpadding="1" bordercolor="#999999">

      <tr>
        <td valign="top"><input type="radio" name="titlemethod" value="1" id="method1" checked>
<label for="method1">��TITLE����ȡ</label></td>
        <td>
			�ָ���0<input type="text" name="keyword0"><br>
			<xmp><%=session("keyword0")%></xmp>
		</td>
      </tr>
      <tr>
        <td rowspan="2" valign="top"><input type="radio" name="titlemethod" value="2" id="method2">
<label for="method2">��BODY����ȡ</label></td>
        <td>
         	�ؼ���A<input type="text" name="keyword3"><br>
		 	<xmp><%=session("keyword3")%></xmp>
		 </td>
      </tr>
      <tr>
        <td>
			�ؼ���B<input type="text" name="keyword4"><br>
			<xmp><%=session("keyword4")%></xmp>
		</td>
      </tr>  
	   <tr>
        <td colspan="2" valign="top"><input type="radio" name="titlemethod" value="3" id="method3">
<label for="method3">���ļ�������ȡ</label></td>
      </tr>
  </table>
	  <input type="submit" name="Submit" value="�ύ">
	  <a href="step1.asp">&lt;-����</a>

</form>
</fieldset>

</body>
</html>