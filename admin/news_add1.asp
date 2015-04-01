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
dim news_title,news_content,news_info,news_author
news_title=trim(request("news_title"))
news_content=trim(request("news_content"))
news_author=trim(request("news_author"))
news_info=trim(request("news_info"))
set rs=server.createobject("adodb.recordset")
sql="select * from news "
rs.open sql,conn,1,3
%>
<%
    rs.addnew
    rs("news_title")=news_title
	rs("news_content")=news_content
	rs("news_author")=news_author
	rs("news_info")=news_info
	rs("news_time")=today
	rs.update
	rs.close
	set rs=nothing
	response.redirect "news_set.asp"
%>