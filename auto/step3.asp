<!--#include file="../inc/inc.asp"-->
<html>
<head><title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
<head>
<body bgcolor="#CCEEFF">
<fieldset class="fs">
<legend>请复查您的输入</legend>
<br>
<div class="readme">单击“预览”无误后再点击“录入”。</div>
<br>
<table width="660" border="1" cellpadding="1" bordercolor="#999999">
  <tr>
    <td width="110">录入者</td>
    <td width="534"><%=session("username")%></td>
  </tr>
  <tr>
    <td>新闻来源</td>
    <td><%=session("ly")%></td>
  </tr>
  <tr>
    <td>关键词</td>
    <td><%=session("key")%></td>
  </tr>
  <tr>
    <td>正文关键字A*</td>
    <td><xmp><%=session("keyword1")%></xmp></td>
  </tr>
  <tr>
    <td>正文关键字B*</td>
    <td><xmp><%=session("keyword2")%></xmp></td>
  </tr>
  <tr>
    <td>标题提取方式</td>
    <td><%=session("titlemethod")%></td>
  </tr>
  <tr>
    <td>标题分隔符</td>
    <td><%=session("keyword0")%></td>
  </tr>
  <tr>
    <td>标题关键字A</td>
    <td><xmp><%=session("keyword3")%></xmp></td>
  </tr>
  <tr>
    <td>标题关键字B</td>
    <td><xmp><%=session("keyword4")%></xmp></td>
  </tr>
</table>
<a href="step2_3.asp">&lt;-返回</a>
<a href="preview.asp" target="_blank">请先预览</a>
<a href="Import.asp">开始录入</a>
</fieldset>
</body>
</head>