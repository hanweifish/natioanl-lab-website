<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
	Response.end
end if
%>

<%
if session("admin_account")=""then
Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
Response.end
end if
%>

<%
dim admin_account
admin_account=session("admin_account")
%>

<%
function HTMLEncode(fString)
if not isnull(fString) then
    fString = replace(fString, ">", "&gt;")
    fString = replace(fString, "<", "&lt;")

    fString = Replace(fString, CHR(32), "&nbsp;")
    fString = Replace(fString, CHR(34), "&quot;")
    fString = Replace(fString, CHR(39), "&#39;")
    fString = Replace(fString, CHR(13), "")
    fString = Replace(fString, CHR(10) & CHR(10), "</P><P> ")
    fString = Replace(fString, CHR(10), "<BR> ")
    HTMLEncode = fString
end if
end function
%>

<script language="javascript">
	function checkform(form)
	{
		if (document.form.news_title.value=="")
		{
			alert("���������ű��⣡");
		}
		else if (document.form.news_content.value=="")
		{
			alert("�������������ݣ�");
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
<title>�ޱ����ĵ�</title>
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
<form name="form" method="post" action="news_add1.asp" >
  <p align="center"><br>
    <br>
    <br>
    <a href="news_add.asp" target="window"><img src="../images/addnews.png" width="120" height="30" border="0"></a></p>
  <p>&nbsp;</p>
  <table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#666666" class="thin">
  <tr>
    <td height="24"><div align="right" class="style10">���ű��⣺&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <input type="text" name="news_title" size="50" /></td>
  </tr>
  <tr>
    <td ><div align="right" class="style10">�������ݣ�&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <textarea name="news_content" cols="50" rows="15"></textarea></td>
  </tr>
  <tr>
    <td height="24"><div align="right" class="style10">���ű�ע��&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <textarea name="news_info" cols="50" rows="5">��</textarea>
    </td>
  </tr>
  <tr>
    <td height="24"><div align="right" class="style10">�����ˣ�&nbsp;&nbsp;</div></td>
    <td class="style10">&nbsp;&nbsp;&nbsp;
        <input type="text" name="news_author" size="25" /></td>
  </tr>
  <tr>
    <td height="35" colspan="2"><div align="center"><img src="../images/add.gif" width="51" height="23" align="absmiddle" style="cursor:hand" onMouseDown="checkform(form)"/></div></td>
  </tr>
</table>
</form>
</body>
</html>
