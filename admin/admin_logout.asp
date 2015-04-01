<%
session("popup")=""
session("admin_account")=""
response.cookies("status")=""
response.write "<script language='javascript'> window.top.location='adminlogin.asp'</script>"
%>