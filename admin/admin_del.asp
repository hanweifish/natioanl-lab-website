<!--#include file="conn.asp"-->
<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>
<%
if session("admin_account")="" or session("user_group")="subadmin" then
Response.write"对不起，您还没有登陆,或者不具备权限！"
Response.end
end if
%>
<%
dim admin_id
admin_id=trim(request("admin_ID"))
set rs=server.createobject("adodb.recordset")
sql="select * from admin_info where admin_ID="&admin_id
rs.open sql,conn,1,3
%>

<%
rs.delete
rs.close
set rs=nothing
response.redirect "admin_info.asp"
%>