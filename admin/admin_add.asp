<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("admin_account")=""  then
Response.write"对不起，您还没有登陆,或者不具备权限！"
Response.end
end if
%>

<%
dim admin_account
admin_account=session("admin_account")
%>

<script language="javascript">
	function checkform()
	{
		if (document.form.admin_account.value=="")
		{
			alert("请输入待添加管理员账号！");
		}
		else if (document.form.admin_pwd.value=="")
		{
			alert("请输入待添加管理员密码！");
		}
	    else
		{
			return true;
		}
		return false;
	}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>无标题文档</title>
<style type="text/css">
<!--
.style10 {font-size: 12px;
	color: #004080;
}
-->
</style>
</head>

<body>
<div align="center">
  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="54" background="adminimages/titlebk1.gif"><div align="center">
        <table width="100%" height="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><div align="center"><img src="../images/admin.png" width="120" height="30" /></div></td>
          </tr>
        </table>
      </div></td>
    </tr>
    <tr>
      <td height="27" background="adminimages/titlebk2.gif">&nbsp;</td>
    </tr>
    <tr>
      <td background="../user/userimages/titlebk.gif"><div align="center">
        <table width="90%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td valign="top"><form action="admin_add1.asp" method="post" name="form" id="form" onSubmit="return checkform()">
              <div align="center">
                <table width="100%" border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" class="thin">
                  <tr>
                    <td height="24"><div align="right" class="style10">管理员帐号：&nbsp;&nbsp;</div></td>
                    <td class="style10">&nbsp;&nbsp;&nbsp;
                            <input name="admin_account" type="text" class="style3" size="24" /></td>
                  </tr>
                  <tr>
                    <td height="24"><div align="right" class="style10">管理员密码：&nbsp;&nbsp;</div></td>
                    <td class="style10">&nbsp;&nbsp;&nbsp;
                            <input name="admin_pwd" type="text" class="style3" size="24" /></td>
                  </tr>
                  <tr>
                    <td height="24"><div align="right" class="style10">管理员权限：&nbsp;&nbsp;</div></td>
                    <td class="style10">&nbsp;&nbsp;&nbsp;
                        <select name="user_group">
                          <option value="admin" selected="selected">admin</option>
                        </select>
                    </td>
                  </tr>
                  <tr>
                    <td height="24"><div align="right" class="style10">备注：&nbsp;&nbsp;</div></td>
                    <td class="style10">&nbsp;&nbsp;&nbsp;
                            <textarea name="admin_info" cols="36" rows="3">无</textarea>                    </td>
                  </tr>
                  <tr>
                    <td height="25" colspan="2"><div align="center">
                      <input type="submit" name="Submit" value="提交" />
                    </div></td>
                  </tr>
                </table>
              </div>
            </form></td>
          </tr>
        </table>
      </div></td>
    </tr>
    <tr>
      <td height="40" background="adminimages/titlebk3.gif">&nbsp;</td>
    </tr>
  </table>
</div>
</body>
</html>
