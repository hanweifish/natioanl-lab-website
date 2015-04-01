<!--#include file="conn.asp"-->

<%
set rsn=server.createobject("adodb.recordset")
sql="select * from news order by news_time desc"
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

<style type="text/css">
<!--
.style10 {font-size: 10pt;
font-family:Verdana, Arial, Helvetica, sans-serif;
	color: #004080;
}
.STYLE16 {font-size: 11pt}
-->
</style>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">

<title>信息快讯</title>
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
<style type="text/css">
<!--
.style11 {font-size: 10pt;
font-family:Verdana, Arial, Helvetica, sans-serif;
	color:#993300;
	}
-->
</style>
<style type="text/css">
<!--
.style12 {color: #08206A}
-->
</style>
<style type="text/css">
<!--
.style13 {color: #000000}
-->
</style>

<link href="../css/css1.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style7 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 9pt; color: #CC6600; }
.STYLE15 {font-size: 14pt; color: #08206A; font-family: Verdana, Arial, Helvetica, sans-serif;}
-->
</style>
</head>

<body>

<table width="620" height="600" border="0">
  <tr>
    <td valign="top"><p align="justify"><span class="style7"><a href="../index.asp" target="_top">NLSSM</a>:</span>
        <span class="style7">Recent News</span>
      <br><hr>
      <table width="90%"   border="0" cellpadding="0" cellspacing="0">
                      <tr>
                        <td colspan="3"><div align="center"><span class="STYLE15"><br>
                          <br>
                        News Release</span>
                          <%if Not(rsn.bof and rsn.eof) then
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
                            <br>
                            <br>
                            <br>
                        </div>
                          <table width="100%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" class="thin">
                              <tr align="center">
                                <td width="442" height="24" align="center" valign="middle"><div align="center" class="style10"><span class="STYLE16">新&nbsp;&nbsp;&nbsp;闻 &nbsp;&nbsp;&nbsp;标 &nbsp;&nbsp;&nbsp;题 </span>
                                </div></td>
                                <td width="128" height="24"><div align="center" class="style10"><span class="STYLE16">发布时间</span>
                                </div></td>
                              </tr>
                              <%if Not(rsn.bof and rsn.eof) then
	rsn.move (Cint(NoncePage)-1)*10,1
	for i=1 to rsn.pagesize
%>
                              <tr>
                                <td width="442" height="25" align="center" valign="middle"><div align="left" class="style10">
                                  <div align="left"><img src="../images/fav_add1.gif" width="15" height="15"><font class="style10" style="cursor:hand" onclick="MM_openBrWindow('news_detail.asp?news_id=<%=rsn("news_ID")%>','新闻','scrollbars=yes,resizable=yes,width=650,height=500')"><%=rsn("news_title")%></font>
                                    </div>
                                </div></td>
                                <td height="25"><div align="center" class="style10"><%=rsn("news_time")%></div></td>
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
                                <td height="24" colspan="8" align="center" valign="middle">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="24" colspan="8" align="center" valign="middle"><div align="right"><span class="style2">
                                    <input type="hidden" name="page" value="<%=NoncePage%>">
                                    <%
if NoncePage>1 then
	response.write "|<a href=recent.asp?page=1>首 页</a>| |<a href=recent.asp?page="&NoncePage-1&">上一页</a>|&nbsp"
else
	response.write "<span class='style10'>|首 页| |上一页|&nbsp;</span>"
end if
if Cint(Trim(NoncePage))<Cint(Trim(NumPage)) then
	response.write "|<a href=recent.asp?page="&NoncePage+1&">下一页</a>| |<a href=recent.asp?page="&NumPage&">尾 页</a>|"
else
	response.write "<span class='style10'>|下一页| |尾 页|</span>"
end if
%>
&nbsp;</span><span class="style10">页次</span><span class="style2">：<font color="#0033CC" class="style11"><%=NoncePage%></font>/<font color="#0033CC" class="style11"><%=NumPage%></font> </span><span class="style10">共</span><span class="style11"><font color="#0033CC" class="style11"><%=NumRecord%></font></span><span class="style10">条记录</span>&nbsp; </div></td>
                              </tr>
                        </table></td>
                      </tr>
      </table><br>      
      </p>
      <p><br>
      </p></td>
  </tr>
</table>
</body>
</html>
