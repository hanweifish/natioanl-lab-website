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
dim conference_ID,page
dim conference_title,conference_content,conference_info,conference_author,conference_time
page=trim(request("page"))
conference_ID=session("conference_ID")
conference_title=trim(request("conference_title"))
conference_content=trim(request("conference_content"))
conference_author=trim(request("conference_author"))
conference_info=trim(request("conference_info"))
conference_time=trim(request("conference_time"))
set rs=server.createobject("adodb.recordset")
sql="select * from conference where conference_id="&conference_ID
rs.open sql,conn,1,3
%>
<%
    rs("conference_title")=conference_title
	rs("conference_content")=conference_content
	rs("conference_author")=conference_author
	rs("conference_info")=conference_info
	rs("conference_time")=conference_time
	rs.update
	rs.close
	set rs=nothing
	response.redirect "conf_set.asp?page="&page
%>