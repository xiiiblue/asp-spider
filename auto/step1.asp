<html>
<head>
<title></title>
<link href="../inc/style.css" rel="stylesheet" type="text/css">
</head>
<body bgcolor="#CCEEFF">


<fieldset>
<legend>��ѡ��Ҫ�ϴ����ļ�</legend>
<div class="readme">�����¼�롱����һ���ڣ�����Ҫ¼����ļ����봰�ڣ�֮��������һ����</div>
<br><br>
<%
username=session("username")
userpass=session("userpass")
response.Write "<a href='ftp://"&username&":"&userpass&"@192.168.1.5' target='_blank'>¼�봰��</a>"
%>
<br>
<br>
<br>
<a href="step2_1.asp">��һ��</a>
</fieldset>

</body>
</html>
