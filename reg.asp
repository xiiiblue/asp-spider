
<html>
<head>
<title>�û�ע��</title>
</head>
<body bgcolor="#CCEEFF">
<%
randomize rnd
regjm=int(rnd*9998)+1
%>
<br><br><br><br><br><br>
  <script language="javascript">
	<!--//
	function checksignup() {
		if ( document.form.nick.value == '' ) {
			window.alert('����������˺�!!');
			document.form.nick.focus();
		}
		else if ( document.form.password.value == '' ) {
			window.alert('����������˺�����!!');
			document.form.password.focus();
		}
		else if ( document.form.yz.value == '' ) {
			window.alert('��������ҳ����ʾ��5λ������֤��\n�����������������Ŀ���������!!');
			document.form.yz.focus();
		}
       else {
		return true;
			}
		return false;
	}
	//-->
	</script>

<TABLE WIDTH=488 BORDER=0 CELLPADDING=0 CELLSPACING=0 align="center">
  <TR> 
    <TD width="488"></TD>
  </TR>
</TABLE>
<form  name="form1" method="get" action="regcheck.asp">
  <table border="0" cellspacing="0" width="172" cellpadding="0" align="center" style="border:1px #cccccc solid" bgcolor=#efefef>
    <tr align="center"> 
      <td width="69" height="28">�ʡ���</td>
      <td width="103"><div align="left"><input name="username" type="text" class=input size="12" maxlength="8">
      </div></td>
    </tr>
    <tr align="center"> 
      <td height="28">�ܡ���</td>
      <td><div align="left"><input name="userpass" type="password" id="pass" size="12" maxlength="12"></div></td>
    </tr>
<tr align="center"> 
      <td height="28">����ȷ��</td>
      <td><div align="left"><input name="userpass2" type="password" id="pass" size="12" maxlength="12"></div></td>
    </tr>
    <tr> 
      <td align="center" height=28> <input type="submit" name="Submit" value=" ȷ �� " class="input1"></td>
      <td align="center" height=28><input type="reset" name="Submit2" value=" �� λ " class="input1"></td>
    </tr>
  </table>
</form>
<script language="JavaScript" src="js/key.js"></script>
</body>
</html>
