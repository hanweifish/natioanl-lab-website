<!--#include file="conn.asp"-->

<%
if request.cookies("status")="" then
    Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
	Response.end
end if
%>

<%
if session("admin_account")=""  then
Response.write"�Բ�������û�е�½���޴�Ȩ�ޣ�"
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
			alert("���������룡");
		}
		else if (document.form.admin_pwd1.value=="")
		{
			alert("������ȷ�����룡");
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
<title>�ޱ����ĵ�</title>
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
            <td height="25"><div align="center" class="style10">����Ա�������</div></td>
          </tr>
          <tr>
            <td><form action="admin_infomod.asp" method="post" name="form" id="form" onSubmit="return checkform()">
              <div align="center">
                <table width="100%" border="1" cellpadding="0"  cellspacing="0" bordercolor="#000000" class="thin">
                  <tr valign="middle">
                    <td height="25" class="style8 style12"><div align="right" class="style3">�����������룺</div></td>
                    <td><span class="style10">&nbsp;
                              <input name="admin_pwd" type="password" class="style3" size="25" />
                    </span></td>
                  </tr>
                  <tr>
                    <td height="25" valign="middle" class="style8 style12"><div align="right" class="style3">����ȷ�����룺</div></td>
                    <td valign="middle"><span class="style10">&nbsp;
                              <input name="admin_pwd1" type="password" class="style3" size="25" />
                    </span></td>
                  </tr>
                  <tr>
                    <td height="25" colspan="2" class="style8 style12"><div align="center">
                      <input type="submit" name="Submit" value="ȷ ��" />
                      &nbsp;&nbsp;&nbsp;
                      <input type="reset" name="Submit" value="�� ��" />
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
            <td height="25" colspan="6"><div align="center" class="style10">����Ա��Ϣ�б�</div></td>
          </tr>
          <tr>
            <td colspan="6"><table width="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#000000" class="thin">
              <tr>
                <td width="100" height="24"><div align="center" class="style10">�ʺ�</div></td>
                <td height="24"><div align="center" class="style10">Ȩ�޼���</div></td>
                <td width="50" height="24"><div align="center" class="style10">ɾ��</div></td>
              </tr>
              <%if Not(rs.bof and rs.eof) then
 	for i=1 to rs.RecordCount
%>
              <tr>
                <td width="100" height="24"><div align="left" class="style10">&nbsp;&nbsp;&nbsp;&nbsp;<%=rs("admin_account")%></div></td>
                <td height="24"><div align="center" class="style10"><%=rs("user_group")%></div></td>
                <td width="50" height="24"><div align="center" class="style10"><a href="admin_del.asp?admin_ID=<%=rs("admin_ID")%>"><font color="#ff6633">ɾ��</font></a></div></td>
              </tr>
              <%rs.movenext
next
else
	response.write "<tr><td colspan=13 height='25'><marquee scrolldelay=120 behavior=alternate><font class='style5' color='#ff6633'>Ŀǰ��û����ӹ���Ա����!!!</font></marquee></td></tr>"
end if	
rs.close
set rs=nothing
%>
            </table></td>
          </tr>
          <tr>
            <td height="25" colspan="6"><div align="center"><a href="admin_add.asp" class="style10">����¹���Ա</a></div></td>
          </tr>
        </table>
      </div></td>
    </tr>
  </table>
</div>
</body>
</html>
