<!--#include file="conn.asp"-->
<script language="javascript">
	function checkuser(form)
	{
		if (document.form.admin_account.value=="")
		{
			alert("请输入用户名！！");
		}
		else if (document.form.admin_pwd.value=="")
		{
			alert("请输入密码！!");
		}
		else
		{
			form.submit();
		}
		return false;
	}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.STYLE1 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10pt;
}
.STYLE3 {font-size: 9pt;
font-family: Verdana, Arial, Helvetica, sans-serif;}
-->
</style>
</head>

<body>
<br>
<br>
<br>
<br>
<br>
<form action="admin_check.asp" method="post" name="form" id="form">
<table width="70%"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="2"><div align="center"><span class="STYLE1">管理员:</span>
      <input name="admin_account" type="text" class="style3" id="name" size="12" />
    </div>
        <div align="left"> </div></td>
  </tr>
  <tr>
    <td height="38" colspan="2"><div align="center"><span class="STYLE1">密 &nbsp;码:</span>
      <input name="admin_pwd" type="password" class="style3" id="pwd" size="12" />
    </div>
        <div align="left"> </div></td>
  </tr>
  <tr>
    <td colspan="2"><div align="center"><img src="../images/login.gif" width="49" height="23" border="0" align="absmiddle" style='cursor:hand' onMouseDown="checkuser(form)" /></div></td>
  </tr>
  <tr>
    <td width="50%" height="10"><div align="center"></div></td>
    <td width="50%">&nbsp;</td>
  </tr>
</table>
</form>
</body>
</html>
