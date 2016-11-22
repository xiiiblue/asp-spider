<html>
<head>
<title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">


<fieldset>
<legend>请选择要上传的文件</legend>
<div class="readme">点击“录入”弹出一窗口，将您要录入的文件拖入窗口，之后点击“下一步”</div>
<br><br>
<%
username=session("username")
userpass=session("userpass")
response.Write "<a href='ftp://"&username&":"&userpass&"@192.168.1.5' target='_blank'>录入窗口</a>"
%>
<br>
<br>
<br>
<a href="step2_1.asp">下一步</a>
</fieldset>

</body>
</html>
