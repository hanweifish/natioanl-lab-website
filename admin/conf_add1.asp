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
dim today
today=Date 
today=Year(today) & "-" & Right("0" & Month(today),2) & "-" & Right("0" & Day(today),2)
dim conference_title,conference_content,conference_info,conference_author
conference_title=trim(request("conference_title"))
conference_content=trim(request("conference_content"))
conference_author=trim(request("conference_author"))
conference_info=trim(request("conference_info"))
set rs=server.createobject("adodb.recordset")
sql="select * from conference "
rs.open sql,conn,1,3
%>
<%
    rs.addnew
    rs("conference_title")=conference_title
	rs("conference_content")=conference_content
	rs("conference_author")=conference_author
	rs("conference_info")=conference_info
	rs("conference_time")=today
	rs.update
	rs.close
	set rs=nothing
	response.redirect "conf_set.asp"
%>