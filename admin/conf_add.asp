<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("admin_account")=""then
Response.write"对不起，您还没有登陆，无此权限！"
Response.end
end if
%>

<%
dim admin_account
admin_account=session("admin_account")
%>
<script language="javascript">
	function checkform(form)
	{
		if (document.form.conference_title.value=="")
		{
			alert("请输入新闻标题！");
		}
		else if (document.form.conference_content.value=="")
		{
			alert("请输入新闻内容！");
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
.style10 {font-size: 10pt;
font-family:Verdana, Arial, Helvetica, sans-serif;
	color: #004080;
}
-->
</style>
</head>

<body>
<form name="form" method="post" action="conf_add1.asp" >
  <p align="center"><br>
    <br>
    <br>
    <a href="conference_add.asp" target="window"><img src="../images/addconf.png" width="150" height="30" border="0"></a></p>
  <p>&nbsp;</p>
  <table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#666666" class="thin">
  <tr>
    <td height="24"><div align="right" class="style10">会议标题：&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <input type="text" name="conference_title" size="50" /></td>
  </tr>
  <tr>
    <td ><div align="right" class="style10">会议内容：&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <textarea name="conference_content" cols="50" rows="15"></textarea></td>
  </tr>
  <tr>
    <td height="24"><div align="right" class="style10">会议备注：&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <textarea name="conference_info" cols="50" rows="5">无</textarea>
    </td>
  </tr>
  <tr>
    <td height="24"><div align="right" class="style10">发布人：&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <input type="text" name="conference_author" size="25" /></td>
  </tr>
  <tr>
    <td height="35" colspan="2"><div align="center"><img src="../images/add.gif" width="51" height="23" align="absmiddle" style="cursor:hand" onMouseDown="checkform(form)"></div></td>
  </tr>
</table>
</form>
</body>
</html>
