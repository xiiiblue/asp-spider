<meta http-equiv="Content-Type" content="text/html; charset=gb2312"><%@language=vbscript codepage=936 %>
<html>
<head>
<title>登陆</title>
<link href="Inc/login.css" rel="stylesheet" type="text/css">
<script language=javascript>
function SetFocus()
{
if (document.Login.username.value=="")
	document.Login.username.focus();
else
	document.Login.username.select();
}
function CheckForm()
{
	if(document.Login.username.value=="")
	{
		alert("请输入用户名！");
		document.Login.username.focus();
		return false;
	}
	if(document.Login.userpass.value == "")
	{
		alert("请输入密码！");
		document.Login.userpass.focus();
		return false;
	}
	if (document.Login.CheckCode.value==""){
       alert ("请输入您的验证码！");
       document.Login.CheckCode.focus();
       return(false);
    }
}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="SetFocus();">
<center>
<table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td>
<table width=526 border=0 align="center" cellpadding=0 cellspacing=0>
  <form name="Login" method="get" action="logincheck.asp" onSubmit="return CheckForm();">
    <tr>
      <td colspan=2><img src='img/al_top.gif' width="526" height="80" border=0></td>
    </tr>
    <tr>
      <td colspan=2>
        <table border=0 cellspacing=0 cellpadding=0 width=526>
          <tr>
            <td width=155><img src='img/al_username.gif' border=0></td>
            <td width=105 background='img/al_body_bg.gif'><input name="username" class="input_login" size=12></td>
            <td width=93><img src='img/al_password.gif' width="93" height="50" border=0></td>
            <td width=105 background='img/al_body_bg.gif'><input name="userpass"  class="input_login" type="Password" size=12></td>
            <td width=68><img src='img/al_body_right.gif' border=0></td>
          </tr>
      </table></td>
    </tr>
    <tr>
      <td colspan=2  >
        <table border=0 cellspacing=0 cellpadding=0 width=526>
          <tr>
            <td width=77><img src='img/al_end_left.gif' border=0></td>
            <td width=339>
              <table border=0 cellspacing=0 cellpadding=0 width=339>
                <tr>
                  <td height=49 background='images/al_end_bg.gif' align=center>
                    <TABLE border=0>
                      <TR class=tr_val>
                        <TD class=>验证码：</TD>
                        <td class=a2 ><input name="CheckCode" class=input_val  size=6 maxlength="6">
                            <img src="inc/checkcode.asp"> </td>
                      </TR>
                  </table></td>
                </tr>
                <tr>
                  <td><img src='img/al_end_end.gif' width="339" height="39" border=0></td>
                </tr>
            </table></td>
            <td width=110><input  name="Submit" type=image src="img/al_end_right.gif" width="110" height="88" border=0 ></td>
          </tr>
      </table></td>
    </tr>
  </form>
</table></td>
        </tr>
      </table>
</center>
</body>
</html>