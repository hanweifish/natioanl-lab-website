<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
	Response.end
end if
%>

<%
if session("admin_account")="" or session("user_group")="" then
Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
Response.end
end if
%>

<%
dim admin_account
admin_account=session("admin_account")
%>


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
<br>
<br>
<br>
<br>
<br>
<table width="90%"  border="0" cellpadding="0" cellspacing="0">
                              <tr>
                                <td colspan="6"><div align="center"><a href="news_add.asp"><img src="../images/addnews.png" width="120" height="30" border="0"></a></div></td>
                              </tr>
                              <tr>
                                <td height="30" colspan="6">&nbsp;</td>
                              </tr>
                              <tr>
                                <td colspan="6"><%
set rs=server.createobject("adodb.recordset")
sql="select * from news order by news_time desc"
rs.open sql,conn,1,1
%>
                                    <%       if Not(rs.bof and rs.eof) then
			NumRecord=rs.recordcount
			rs.pagesize=10
			NumPage=rs.Pagecount
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
                                      <tr>
                                        <td width="105" height="24"><div align="center" class="style10">��������</div></td>
                                        <td width="449" height="24"><div align="center" class="style10">���ű���</div></td>
                                        <td width="46" height="24"><div align="center" class="style10">�޸�</div></td>
                                        <td width="53" height="24"><div align="center" class="style10">ɾ��</div></td>
                                      </tr>
                                      <%if Not(rs.bof and rs.eof) then
	rs.move (Cint(NoncePage)-1)*10,1
	for i=1 to rs.pagesize
%>
                                      <tr>
                                        <td width="105" height="24"><div align="left" class="style10">&nbsp;&nbsp;<%=rs("news_time")%></div></td>
                                        <td height="24"><div align="left" class="style10">&nbsp;&nbsp;<%=rs("news_title")%></div></td>
                                        <td width="46" height="24"><div align="center" class="style10"><a href=news_mod.asp?news_ID=<%=rs("news_ID")%>><font color="#ff6633">�޸�</font></a></div></td>
                                        <td width="53" height="24"><div align="center" class="style10"><a href=news_del.asp?news_ID=<%=rs("news_ID")%>><font color="#ff6633">ɾ��</font></a></div></td>
                                      </tr>
                                      <%rs.movenext
if rs.eof then exit for
	next
else
	response.write "<tr><td colspan=13 height='24'><marquee scrolldelay=120 behavior=alternate><font class='style5' color='#ff6633'>û���ҵ��κμ�¼!!!</font></marquee></td></tr>"
end if	
rs.close
set rs=nothing
%>
                                      <tr>
                                        <td height="24" colspan="8"><div align="right" class="style2"> <span class="style10">
                                            <input type="hidden" name="page" value="<%=NoncePage%>">
                                            <%
if NoncePage>1 then
	response.write "|<a href=news_set.asp?page=1>�� ҳ</a>| |<a href=news_set.asp?page="&NoncePage-1&">��һҳ</a>|&nbsp"
else
	response.write "|�� ҳ| |��һҳ|&nbsp"
end if
if Cint(Trim(NoncePage))<Cint(Trim(NumPage)) then
	response.write "|<a href=news_set.asp?page="&NoncePage+1&">��һҳ</a>| |<a href=news_set.asp?page="&NumPage&">β ҳ</a>|"
else
	response.write "|��һҳ| |β ҳ|"
end if
%>
                                        </span> &nbsp;<span class="style10">ҳ��</span>��<span class="style10"><font color="#0033CC"><%=NoncePage%></font>/<font color="#0033CC"><%=NumPage%></font> ��<font color="#0033CC"><%=NumRecord%></font>����¼</span>&nbsp; </div></td>
                                      </tr>
                                  </table></td>
                              </tr>
                            </table>
</body>
</html>
