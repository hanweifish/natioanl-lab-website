<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>

<%
if session("admin_account")="" or session("user_group")="subadmin" then
Response.write"对不起，您还没有登陆或者无此权限！"
Response.end
end if
dim admin_account
admin_account=session("admin_account")
%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>NLSSM</title>
<style type="text/css">
<!--
body {
	background-color: #dcdcdd;
	margin-left: 0px;
	margin-top: 6px;
	margin-right: 0px;
	margin-bottom: 0px;
}
.style2 {
	color: #016798;
	font-weight: bold;
	font-size: 11pt;
	font-family: Verdana, Arial, Helvetica, sans-serif;
}
.style3 {font-size: 9pt}
.style4 {color: #666666}
.new1 {
	color: #FFFFFF;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 10pt;
	font-weight: bold;
}
.style14 {color: #08206A}
.style15 {color: #08206A; font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10pt; font-weight: bold; }
.style16 {
	color: #FFFFFF;
	font-size: 9px;
}
.style20 {color: #FF6600}
-->
</style>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_reloadPage(init) {  //reloads the window if Nav4 resized
  if (init==true) with (navigator) {if ((appName=="Netscape")&&(parseInt(appVersion)==4)) {
    document.MM_pgW=innerWidth; document.MM_pgH=innerHeight; onresize=MM_reloadPage; }}
  else if (innerWidth!=document.MM_pgW || innerHeight!=document.MM_pgH) location.reload();
}
MM_reloadPage(true);

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_showHideLayers() { //v6.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
//-->
</script>
<link href="../css/indexcss.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style25 {font-size: 10pt}
.style26 {font-family: Verdana, Arial, Helvetica, sans-serif}
.style28 {font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 10px; }
.style31 {
	font-size: 8pt;
	color: #000000;
	font-style: italic;
}
.style32 {font-size: 9px}
.STYLE33 {font-size: 11pt; font-family: Verdana, Arial, Helvetica, sans-serif; color: #016798;}
-->
</style>
</head>

<body>
<table width="82%"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td valign="top"><table width="100%" height="134%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
      <tr>
        <td height="530" valign="top" bgcolor="#FFFFFF"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
        </table>                    
          <table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#E1F5FE">
            <tr>
              <td bgcolor="#FFFFFF"><div align="center"><img src="../images/logo.png" width="770" height="133" hspace="0" vspace="0" border="0" usemap="#Map" ></div></td>
            </tr>
          </table>
          <table width="18%" height="60%" border="0" align="left" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
            <tr>
              <td>&nbsp;</td>
              <td class="style3">&nbsp;</td>
            </tr>
            <tr>
              <td width="5%">&nbsp;</td>
              <td width="60%" class="style3"><%=admin_account%>：</td>
            </tr>
            <tr>
              <td height="13">&nbsp;</td>
              <td class="style3">您已经登录成功,可</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td class="style3">以正常维护网站!</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td bgcolor="#FFFFFF"><div align="left"><a href="../organizationall.asp" target="_self"></a><a href="admin_logout.asp">注销</a></div></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td bgcolor="#FFFFFF"><span class="style15"><a href="news_set.asp" target="window"><img src="../images/newscontrol.png" width="120" height="30" border="0"></a></span></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td bgcolor="#FFFFFF" class="style15"><a href="conf_set.asp" target="window"><img src="../images/onference.png" width="120" height="30" border="0"></a></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td  bgcolor="#FFFFFF" class="style15"><img src="../images/facility.png" width="120" height="30" style="border:0px"></td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td valign="top"  bgcolor="#FFFFFF" class="style20 style26 style31">&nbsp;</td>
            </tr>
            <tr>
              <td>&nbsp;</td>
              <td valign="middle" bgcolor="#FFFFFF" class="style20"><a href="admin_info.asp" target="window"><img src="../images/admin.png" width="120" height="30" border="0"></a></td>
            </tr>
          </table>
          <div id="Staff" style="position:absolute; width:85px; height:105px; z-index:1; left: 376px; top: 159px; visibility: hidden;" onMouseOver="MM_showHideLayers('News','','hide','Staff','','show','Opportunity','','hide','Science','','hide')" onMouseOut="MM_showHideLayers('News','','hide','Staff','','hide','Opportunity','','hide','Science','','hide')">
            <table width="100%" height="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">General</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Leadership</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Faculty</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Sponsor</div></td>
              </tr>
            </table>
          </div>
          <div id="Opportunity" style="position:absolute; width:85px; height:105px; z-index:1; left: 455px; top: 159px; visibility: hidden;" onMouseOver="MM_showHideLayers('News','','hide','Staff','','hide','Opportunity','','show','Science','','hide')" onMouseOut="MM_showHideLayers('News','','hide','Staff','','hide','Opportunity','','hide','Science','','hide')">
            <table width="100%" height="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Job</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Training</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Research</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Published</div></td>
              </tr>
            </table>
          </div>
          <div id="Science" style="position:absolute; width:85px; height:105px; z-index:1; left: 234px; top: 159px; visibility: hidden;" onMouseOver="MM_showHideLayers('News','','hide','Staff','','hide','Opportunity','','hide','Science','','show')" onMouseOut="MM_showHideLayers('News','','hide','Staff','','hide','Opportunity','','hide','Science','','hide')">
            <table width="100%" height="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF">
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Procurement</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Groups</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Facility</div></td>
              </tr>
              <tr>
                <td bgcolor="#08206A" class="new1"><div align="center">Published</div></td>
              </tr>
            </table>
          </div>
          <table width="680" height="680"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td width="680" valign="top">
			  <Iframe src="news_set.asp" name=window width="670" height="680" scrolling="no"  frameborder="0"></iframe>			  </td>
              </tr>
          </table></td>
      </tr>
    </table>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#08206A">
        <tr>
          <td height="6"></td>
        </tr>
      </table>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="120" bgcolor="#FFFFFF"><table width="100%" height="100%" border="0">
            <tr>
              <td><div align="center">
                <p><a href="../science.asp"><img src="../images/ecd1.png" width="100" height="100" border="0" style="border:solid 1px #08206A"></a><br>
                  <span class="style20 style25 style26"><a href="../science.asp" target="_self"><img src="../images/title1.png" width="60" height="25" style="border:solid 0px #08206A"></a></span>                </p>
                </div></td>
              <td><div align="center"><a href="../staff.asp"><img src="../images/people2.JPG" width="100" height="100" border="0" style="border:solid 1px #08206A"></a><br>
                  <span class="style20 style25 style26"><a href="../staff.asp" target="_self"><img src="../images/title2.png" width="60" height="25" style="border:solid 0px #08206A"></a>                  </span></div></td>
              <td><div align="center"><a href="../location.asp"><img src="../images/2map.JPG" width="100" height="100" border="0" style="border:solid 1px #08206A"></a><br>
			      <span class="style20 style25 style26"><a href="../location.asp" target="_self"><img src="../images/title3.png" width="60" height="25" style="border:solid 0px #08206A"></a></span><b>
                 </div></td>
            </tr>
          </table></td>
        </tr>
      </table>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="12" bgcolor="#08206A"><div align="right"><span class="style16">2006-06-25</span></div></td>
        </tr>
      </table>
      <table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td height="60" bgcolor="#FFFFFF"><table width="100%" height="100%" border="0">
            <tr>
              <td width="29%"><div align="center"><img src="../images/nju11.jpg" width="46" height="54"></div></td>
              <td width="42%"><div align="center"><span class="style28"> </span>
                <p class="style26 style32">COPYRIGHT&copy;National Laboratory of Solid State Microstructures<br>
                  Nanjing University. <br>
  All rights reserved. </p>
              </div></td>
              <td width="29%"><div align="center"><span class="style28"> Operated by NLSSM </span></div></td>
            </tr>
          </table></td>
        </tr>
      </table></td>
  </tr>
</table>


<map name="Map">
  <area shape="rect" coords="82,99,161,124" href="../science.asp" target="_self">
<area shape="rect" coords="349,99,430,125" href="../Conferences.asp" target="_self">
<area shape="rect" coords="168,97,248,125" href="../Facility.asp" target="_self">
<area shape="rect" coords="442,100,520,124" href="../project.asp" target="_self">
<area shape="rect" coords="262,100,340,125" href="../staff.asp" target="_self">
<area shape="rect" coords="529,100,609,125" href="../apply.asp" target="_self">
<area shape="rect" coords="5,5,762,95" href="../index.asp" target="_self">
<area shape="rect" coords="626,95,764,123" href="../sitesen/index.asp" target="_self">
</map></body>
</html>
