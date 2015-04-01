<!--#include file="conn.asp"-->
<%
if request.cookies("status")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>
<%
if session("admin_account")="" then
    Response.write"对不起，您还没有登陆，无此权限！"
	Response.end
end if
%>
<%
dim news_ID
news_ID=trim(request("news_ID"))
set rs=server.createobject("adodb.recordset")
sql="select * from news where news_ID="&news_id
rs.open sql,conn,1,3
%>

<%
rs.delete
rs.close
set rs=nothing
response.redirect "news_set.asp"
%>