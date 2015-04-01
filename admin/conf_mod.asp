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
<%
dim conference_id,page
page= trim(request("page"))
conference_id=trim(request("conference_ID"))
session("conference_ID")=conference_id
set rs=server.createobject("adodb.recordset")
sql="select * from conference where conference_ID="&conference_id
rs.open sql,conn,1,3
%>

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
.style101 {font-size: 12px;
	color: #004080;
}
-->
</style>
</head>

<body>
<form name="form" method="post" action="conf_mod1.asp" >
  <p align="center"><br>
    <br>
    <br>
  <a href="conference_add.asp" target="window"><img src="../images/addconf.png" width="150" height="30" border="0"></a></p>
  <div align="center">
    <table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" class="thin">
      <tr>
        <td width="100" height="24"><div align="right" class="style101">
            <div align="center">会议标题：</div>
        </div></td>
        <td class="style101">&nbsp;&nbsp;&nbsp;
            <input type="text" name="conference_title" value="<%=rs("conference_title")%>" size="50"></td>
      </tr>
      <tr>
        <td width="100" ><div align="right" class="style101">
            <div align="center">会议内容：</div>
        </div></td>
        <td class="style101">&nbsp;&nbsp;&nbsp;
        <textarea name="conference_content" cols="50" rows="15" ><%=rs("conference_content")%></textarea></td>
      </tr>
      <tr>
        <td width="100" ><div align="right" class="style10">
            <div align="center">会议备注：</div>
        </div></td>
        <td class="style101">&nbsp;&nbsp;&nbsp;
            <textarea name="conference_info" cols="50" rows="5"><%=rs("conference_info")%></textarea>        </td>
      </tr>
      <tr>
        <td height="24"><div align="right" class="style101">
            <div align="center">发布时间：</div>
        </div></td>
        <td class="style101">&nbsp;&nbsp;&nbsp;
            <input name="conference_time" type="text" id="conference_time" value="<%=rs("conference_time")%>">
          &nbsp;&nbsp;&nbsp;&nbsp;（格式：2005-05-06）</td>
      </tr>
      <tr>
        <td height="24"><div align="right" class="style101">
            <div align="center">发布人：</div>
        </div></td>
        <td class="style101">&nbsp;&nbsp;&nbsp;
            <input type="text" name="conference_author" value="<%=rs("conference_author")%>"></td>
      </tr>
      <tr>
        <td height="35" colspan="2"><div align="center"><img src="../images/editSub.gif" width="70" height="25" align="absmiddle" style="cursor:hand; " onMouseDown="javascript:submit();"> </div></td>
      </tr>
    </table>
  </div>
</form>
</body>
</html>
