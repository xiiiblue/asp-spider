<!--#include file="../inc/inc.asp"-->
<html>
<head><title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
<head>
<body bgcolor="#CCEEFF">
<fieldset class="fs">
<legend>�븴����������</legend>
<br>
<div class="readme">������Ԥ����������ٵ����¼�롱��</div>
<br>
<table width="660" border="1" cellpadding="1" bordercolor="#999999">
  <tr>
    <td width="110">¼����</td>
    <td width="534"><%=session("username")%></td>
  </tr>
  <tr>
    <td>������Դ</td>
    <td><%=session("ly")%></td>
  </tr>
  <tr>
    <td>�ؼ���</td>
    <td><%=session("key")%></td>
  </tr>
  <tr>
    <td>���Ĺؼ���A*</td>
    <td><xmp><%=session("keyword1")%></xmp></td>
  </tr>
  <tr>
    <td>���Ĺؼ���B*</td>
    <td><xmp><%=session("keyword2")%></xmp></td>
  </tr>
  <tr>
    <td>������ȡ��ʽ</td>
    <td><%=session("titlemethod")%></td>
  </tr>
  <tr>
    <td>����ָ���</td>
    <td><%=session("keyword0")%></td>
  </tr>
  <tr>
    <td>����ؼ���A</td>
    <td><xmp><%=session("keyword3")%></xmp></td>
  </tr>
  <tr>
    <td>����ؼ���B</td>
    <td><xmp><%=session("keyword4")%></xmp></td>
  </tr>
</table>
<a href="step2_3.asp">&lt;-����</a>
<a href="preview.asp" target="_blank">����Ԥ��</a>
<a href="Import.asp">��ʼ¼��</a>
</fieldset>
</body>
</head>