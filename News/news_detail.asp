<!--#include file="conn.asp"-->
<%
dim news_ID
news_ID=trim(request("news_ID"))
set rsn=server.createobject("adodb.recordset")
sql="select * from news where news_ID="&news_ID
rsn.open sql,conn,1,1
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

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
.style10 {font-size: 9pt;
	color:black;
}
.style3 {font-size: 12pt;
font-family:Verdana, Arial, Helvetica, sans-serif;
	color:
	#993300;
-->
p{font-size: 10pt;
font-family:Verdana, Arial, Helvetica, sans-serif;
	color: #004080;
}
</style>
<title>News Release</title>
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
}
-->
</style>

<style type="text/css">
<!--
.style9 {font-size: 9pt}
-->
</style>

<style type="text/css">
<!--
.style11 {font-size: 9px}
-->
</style>
<style type="text/css">
<!--
.style12 {color: #000000}
-->
</style>

<link href="../css/css1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style7 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; color: #CC6600; }
.style91 {font-size: 12px}
.STYLE92 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 9pt;
	color: #000000;
}
-->
</style>
</head>

<body>

<div align="center">
  <table width="620" height="600" border="0">
    <tr>
      <td valign="top"><p align="justify"><span class="style7"><a href="../index.asp" target="_top">NLSSM</a>:</span>
        <span class="style7">News----&gt;News Release </span>
        <hr>
        <table width="613" height="43" border="0"  style="table-layout:fixed;word-break:break-all">
          <tr>
            <td><div align="center"><span class="style10"><span class="style11"><span class="style11"><span class="style9"><span class="style9"><span class="style12"></span></span></span></span></span></span>
              <table width="80%"  border="0" cellpadding="0" cellspacing="0" class="thin">
                <tr>
                  <td><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                      <td height="25" bgcolor="#CFDBEF"><div align="center" class="style3"><%=rsn("news_title")%></div></td>
                      </tr>
                    <tr>
                      <td><div align="center">
                        <table width="80%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            <td width="39%" height="20" class="style91">发布人：<%=rsn("news_author")%></td>
                                <td width="17%" class="style91"><div align="right"></div></td>
                                <td width="44%" class="style91"><div align="right">发布时间：<%=rsn("news_time")%>&nbsp;&nbsp;</div></td>
                              </tr>
                          <tr>
                            <td height="20" colspan="3"><div align="left"></div></td>
                              </tr>
                          <tr>
                            <td colspan="3" class="style10"><br>
                              <div class="style10"><%=rsn("news_content")%></div><br>
                              &nbsp;</td>
                              </tr>
                          <tr>
                            <td height="25" colspan="3" class="style2"><span class="STYLE92">备注信息</span>：</td>
                              </tr>
                          <tr>
                            <td colspan="3" class="style10"><div align="left"><%=HTMLEncode(rsn("news_info"))%></div></td>
                              </tr>
                          </table>
                        </div></td>
                      </tr>
                    </table></td>
                </tr>
                </table>
            </div></td>
          </tr>
          <tr>
            <td><div align="center"><span class="style9"><a href="javascript:window.close()">关闭窗口</a></span></div></td>
          </tr>
        </table>
        <p>&nbsp;</p></td>
    </tr>
  </table>
</div>
</body>
</html>
