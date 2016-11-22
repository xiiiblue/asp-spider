
<html>
<head>
<title>用户注册</title>
</head>
<body bgcolor="#CCEEFF">

<br><br><br><br><br>
  <script language="javascript">
	<!--//
	function checksignup() {
		alert("asdf");
		if ( document.form.oldpass.value == '' ) {
			window.alert('请输入管理账号!!');
			document.form.oldpass.focus();
		}
		else if ( document.form.password.value == '' ) {
			window.alert('请输入管理账号密码!!');
			document.form.password.focus();
		}
		else if ( document.form.password2.value == '' ) {
			window.alert('请输入网页上显示的5位数的验证码\n如果看不到请点击后面的看不到连接!!');
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
<form  name="form1" method="get" action="altpasscheck.asp">
  <table border="0" cellspacing="0" width="172" cellpadding="0" align="center" style="border:1px #cccccc solid" bgcolor=#efefef>
    <tr align="center"> 
      <td width="69" height="28">旧密码</td>
      <td width="103"><div align="left"><input name="oldpass" type="password" id="oldpass" size="12" maxlength="8"></div></td>
    </tr>
    <tr align="center"> 
      <td height="28">新密码</td>
      <td><div align="left"><input name="userpass" type="password" id="pass1" size="12" maxlength="12"></div></td>
    </tr>
<tr align="center"> 
      <td height="28">密码确认</td>
      <td><div align="left"><input name="userpass2" type="password" id="pass2" size="12" maxlength="12"></div></td>
    </tr>
    <tr> 
      <td align="center" height=28> <input type="submit" name="Submit" value=" 确 认 " onClick="check()"></td>
      <td align="center" height=28><input type="reset" name="Submit2" value=" 复 位 " ></td>
    </tr>
  </table>
</form>
</body>
</html>
