<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("admin_account")=""  then
Response.write"对不起，您还没有登陆，无此权限！"
Response.end
end if
%>

<%
dim admin_account
admin_account=session("admin_account")
%>

<%
set rs=server.createobject("adodb.recordset")
sql="select * from admin_info"
rs.open sql,conn,1,1
%>
<script language="javascript">
	function checkform()
	{
		if (document.form.admin_pwd.value=="")
		{
			alert("请输入密码！");
		}
		else if (document.form.admin_pwd1.value=="")
		{
			alert("请输入确认密码！");
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
.style12 {color: #006699;
	font-size: 12px;
}
-->
</style>
</head>

<body>
<p>&nbsp;</p>
<p align="center"><img src="../images/admin.png" width="120" height="30" /><br />
  <br />
</p>
<div align="center">
  <table width="90%"  cellspacing="0" cellpadding="0">
    <tr>
      <td><div align="center">
        <table width="100%"  cellspacing="0" cellpadding="0">
          <tr>
            <td height="25"><div align="center" class="style10">管理员密码更改</div></td>
          </tr>
          <tr>
            <td><form action="admin_infomod.asp" method="post" name="form" id="form" onSubmit="return checkform()">
              <div align="center">
                <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#000000" class="thin">
                  <tr valign="middle">
                    <td height="25" class="style8 style12"><div align="right" class="style3">请输入新密码：</div></td>
                    <td><span class="style10">&nbsp;
                              <input name="admin_pwd" type="password" class="style3" size="25" />
                    </span></td>
                  </tr>
                  <tr>
                    <td height="25" valign="middle" class="style8 style12"><div align="right" class="style3">输入确认密码：</div></td>
                    <td valign="middle"><span class="style10">&nbsp;
                              <input name="admin_pwd1" type="password" class="style3" size="25" />
                    </span></td>
                  </tr>
                  <tr>
                    <td height="25" colspan="2" class="style8 style12"><div align="center">
                      <input type="submit" name="Submit" value="确 定" />
                      &nbsp;&nbsp;&nbsp;
                      <input type="reset" name="Submit" value="清 除" />
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
      <td><div align="center">
        <table width="100%"  border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td height="25" colspan="6">&nbsp;</td>
          </tr>
          <tr>
            <td height="25" colspan="6"><div align="center" class="style10">管理员信息列表</div></td>
          </tr>
          <tr>
            <td colspan="6"><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" class="thin">
              <tr>
                <td width="100" height="24"><div align="center" class="style10">帐号</div></td>
                <td height="24"><div align="center" class="style10">权限级别</div></td>
                <td width="50" height="24"><div align="center" class="style10">删除</div></td>
              </tr>
              <%if Not(rs.bof and rs.eof) then
 	for i=1 to rs.RecordCount
%>
              <tr>
                <td width="100" height="24"><div align="left" class="style10">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs("admin_account")%></div></td>
                <td height="24"><div align="center" class="style10"><%=rs("user_group")%></div></td>
                <td width="50" height="24"><div align="center" class="style10"><a href="admin_del.asp?admin_ID=<%=rs("admin_ID")%>"><font color="#ff6633">删除</font></a></div></td>
              </tr>
              <%rs.movenext
next
else
	response.write "<tr><td colspan=13 height='25'><marquee scrolldelay=120 behavior=alternate><font class='style5' color='#ff6633'>目前还没有添加管理员助手!!!</font></marquee></td></tr>"
end if	
rs.close
set rs=nothing
%>
            </table></td>
          </tr>
          <tr>
            <td height="25" colspan="6"><div align="center"><a href="admin_add.asp" class="style10">添加新管理员</a></div></td>
          </tr>
        </table>
      </div></td>
    </tr>
  </table>
</div>
</body>
</html>
