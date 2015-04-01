<!--#include file="conn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
sql="select top 4 * from news order by news_id desc"
rs.open sql,conn,1,1
%>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>无标题文档</title>
<style type="text/css">
<!--
body {
	background-color: #FFFFFF;
	margin-left: 0px;
	margin-top: 0px;
}
.style1 {
	font-size: 10pt;
	color: #08206A;
}
.style6 {font-size: 9pt}
.style7 {font-size: 12pt}
.style8 {
	color: #FF00FF;
	font-weight: bold;
}
.style12 {
	font-family: Verdana, Arial, Helvetica, sans-serif;
	color: #FF0000;
}
-->
</style>
<link href="css/css1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style14 {font-size: 10pt}
.style17 {font-family: Geneva, Arial, Helvetica, sans-serif}
.style18 {font-family: Verdana, Arial, Helvetica, sans-serif}
-->
</style>
<style type="text/css">
<!--
.style10 {font-size: 9pt;
font-family:Verdana, Arial, Helvetica, sans-serif;
	color: #004080;
}
-->
</style>
</head>

<body>
<table width="660" height="495" border="0">
  <tr>
    <td height="442" colspan="2"><p><img src='images/logo2.jpg' width="413" height="415"></p>
    <p align="right" class="style1">Full story </p></td>
    <td width="207"><table width="207" height="440" border="0">
      <tr>
        <td width="201" valign="top" height="20"><div align="center"><strong><img src="images/xinwen.jpg" width="120" height="20"><br><hr color=blue>
        </strong></div></td>
      </tr>
      <%
if not (rs.eof and rs.bof) then
for i=1 to rs.recordcount
%>
      <tr>
        <td height="50"><div align="left"><font class="style10" style="cursor:hand" onclick="MM_openBrWindow('news/news_detail.asp?news_id=<%=rs("news_ID")%>','新闻','scrollbars=yes,resizable=yes,width=650,height=400')"><%=(rs("news_title"))%></font></div></td>
      </tr>
 <%
rs.movenext
next
%>
      <%
else
%>
      <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0" bordercolor="#A8BAFF">
        <tr>
          <td><div align="center"><font class="style3" >暂时没有新的通知发布！</font></div></td>
        </tr>
      </table>
      <%
	end if
%>	  
	  
	  
	  
      <tr>
        <td height="27" class="style7 style8"><div align="center"><img src="images/lianjie.jpg" width="120" height="20"><br>
                <hr color=blue
>
        </div></td>
      </tr>
      <tr>
        <td height="27" class="style7 style8"><div align="center">
            <p><a href="http://www.most.gov.cn/" target=_blank><img src="images/link_kejibu.jpg" width="150" height="25" border="0" onMouseOver="this.style.filter='invert';" onMouseOut="this.style.filter='alpha(opacity=100)';"></a><br>
                <a href="http://www.moe.edu.cn/" target=_blank><img src="images/link_moedu.jpg" width="150" height="25" border="0" onMouseOver="this.style.filter='invert';" onMouseOut="this.style.filter='alpha(opacity=100)';"></a><br>
                <a href="http://www.nsfc.gov.cn/" target=_blank><img src="images/link_jijin.jpg" width="150" height="25" border="0" onMouseOver="this.style.filter='invert';" onMouseOut="this.style.filter='alpha(opacity=100)';"></a><br>
                <a href="http://phyvirtual.nju.edu.cn/" target=_blank><img src="images/link_solid.jpg" width="150" height="25" border="0" onMouseOver="this.style.filter='invert';" onMouseOut="this.style.filter='alpha(opacity=100)';"></a> <br>
                <a href="http://physics.nju.edu.cn/newphy/index.asp" target="_blank"><img src="images/physics.jpg" width="150" height="25" border="0" onMouseOver="this.style.filter='invert';" onMouseOut="this.style.filter='alpha(opacity=100)';"></a><br>
          <a href="http://www.nju.edu.cn/cps/site/material/mat/index.htm" target="_blank"><img src="images/cailiao.jpg" width="150" height="30" border="0" onMouseOver="this.style.filter='invert';" onMouseOut="this.style.filter='alpha(opacity=100)';"></a>        <hr color=blue
></div></td>
      </tr>
      

    </table></td>
  </tr>
</table>
</body>

</html>
