<!--#include file="conn.asp"-->

<%
set rsn=server.createobject("adodb.recordset")
sql="select * from conference order by conference_time desc"
rsn.open sql,conn,1,1
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
	margin-left: 0px;
	margin-top: 0px;
}
-->
</style>
<style type="text/css">
<!--
.style8 {
	font-size: 14pt;
	color: #08206A;
}
-->
</style>
<link href="../css/css1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style7 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; color: #CC6600; }
.STYLE9 {color: #08206A}
.style10 {font-size: 12px;
	color: #004080;
}
-->
</style>
</head>

<body>
<table width="620" height="600" border="0">
  <tr>
    <td valign="top"><p align="justify"><span class="style7"><a href="../index.asp" target="_top">NLSSM</a>:</span>
        <span class="style7">Seminar</span>
      <hr>
      <p align="center" class="style8">&nbsp;</p>
      <p align="center" class="style8">学术报告</p>
      <div align="center">
        <table width="90%" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="6"><%if Not(rsn.bof and rsn.eof) then
			NumRecord=rsn.recordcount
			rsn.pagesize=10
			NumPage=rsn.Pagecount
			if request("page")=empty then 
			NoncePage=1
		else
		if Cint(request("page"))<1 then
			NoncePage=1
		else
			NoncePage=request("page")
		end if
		if Cint(Trim(request("page")))>Cint(NumPage) then NoncePage=NumPage
	end if
else
	NumRecord=0
	NumPage=0
	NoncePage=0
	end if
%>
                <table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" class="thin">
                  <tr align="center">
                    <td width="150" height="24" align="center" valign="middle"><div align="center" class="style10"> 发布时间 </div></td>
                    <td width="352" height="24"><div align="center" class="style10">会 &nbsp;&nbsp;&nbsp;议 &nbsp;&nbsp;&nbsp;标 &nbsp;&nbsp;&nbsp;题 </div></td>
                    <td width="35"><div align="center" class="style10">点击</div></td>
                  </tr>
                  <%if Not(rsn.bof and rsn.eof) then
	rsn.move (Cint(NoncePage)-1)*10,1
	for i=1 to rsn.pagesize
%>
                  <tr>
                    <td width="150" height="25" align="center" valign="middle"><div align="left" class="style10">
                        <div align="center"><%=rsn("conference_time")%></div>
                    </div></td>
                    <td height="25"><div align="left"></div>
                        <div align="left"><img src="../images/fav_add1.gif" width="15" height="15"><font class="style10" style="cursor:hand" onclick="MM_openBrWindow('conference_detail.asp?conference_id=<%=rsn("conference_ID")%>','新闻','scrollbars=yes,resizable=yes,width=650,height=500')"><%=rsn("conference_title")%></font></div></td>
                    <td><div align="center" class="style7"><%=rsn("conference_click")%></div></td>
                  </tr>
                  <%rsn.movenext
if rsn.eof then exit for
	next
else
	response.write "<tr><td colspan=13 height='25'><marquee scrolldelay=120 behavior=alternate><font class='style3' color='#ff6633'>暂时还没有通知发布!!!</font></marquee></td></tr>"
end if	
rsn.close
set rsn=nothing
%>
                  <tr>
                    <td height="24" colspan="9" align="center" valign="middle"><div align="right"><span class="style2">
                        <input type="hidden" name="page" value="<%=NoncePage%>">
                        <%
if NoncePage>1 then
	response.write "|<a href=conferencelist.asp?page=1>首 页</a>| |<a href=conferencelist.asp?page="&NoncePage-1&">上一页</a>|&nbsp"
else
	response.write "<font class=style10>|首 页| |上一页|&nbsp</font>"
end if
if Cint(Trim(NoncePage))<Cint(Trim(NumPage)) then
	response.write "|<a href=conferencelist.asp?page="&NoncePage+1&">下一页</a>| |<a href=conferencelist.asp?page="&NumPage&">尾 页</a>|"
else
	response.write "<font class=style10>|下一页| |尾 页|</font>"
end if
%>
                      &nbsp;</span><span class="style10">页次</span><span class="style2">：<font color="#0033CC" class="style7"><%=NoncePage%></font>/<font color="#0033CC" class="style7"><%=NumPage%></font> </span><span class="style10">共</span><span class="style7"><font color="#0033CC" class="style7"><%=NumRecord%></font></span><span class="style10">条记录</span>&nbsp; </div></td>
                  </tr>
              </table></td>
          </tr>
        </table>
      </div>      <p align="center" class="style8">&nbsp;</p></td>
  </tr>
</table>
</body>
</html>
