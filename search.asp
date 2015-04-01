<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>站内搜索</title>
<style type="text/css">
<!--
body {background-color: #fff;margin:0px;font-size:14px;}
table{padding:0px 10px 0px 10px;}
input.text{border:1px solid #36c;background-color:#fff;height:16px;}
input.button{border:1px solid #36c;background-color:#fff;height:20px;}
.site{margin:10px;margin-bottom:0px;font-size:18px;font-family:Tahoma;font-weight:bold;}
a:hover{color:#f60;}
a{color:#00f}
.search{margin:10px;}
.notfound{margin:10px;}
.info{margin:0px;height:24px;background-color:#e5ecf9;border-top:1px solid #36c;padding:6px 10px 0px 16px}
.resultNum{	background-color:#d9e1f7;margin-bottom:10px;padding:4px 8px 4px 8px;border-top:1px solid #009;font-size:14px;}
.keywords{color:#f00;font-weight:bold;}
.foot{border-top:1px solid #36c;color:#333;margin:0px;text-align:center;height:40px;background-color:#e5ecf9;padding:10px;}
#logo{margin-top: 110px;margin-left:auto;margin-right:auto;width:330px;height:72px;}
#line{margin-left:auto;margin-right:auto;height:5px;padding:0px;width:330px;background-image:url(images/line.gif);background-repeat:no-repeat;}
#searchIndex{margin-top:20px;margin-left:auto;margin-right:auto;margin-bottom:120px;text-align:center;font-size:14px;}
-->
</style></head>

<body>
<%
'要搜索网站的URL
Const site="site:http://vl-ssm.nju.edu.cn/"

'声明一个函数，用于读取远程文件
function getHTTPPage(url)
dim Http
set Http=server.createobject("MSXML2.XMLHTTP")
Http.open "GET",url,false
Http.send()
if Http.readystate<>4 then 
exit function
end if
getHTTPPage=bytesToBSTR(Http.responseBody,"utf-8")
set http=nothing
if err.number<>0 then err.Clear 
end function

'声明一个函数，对读取的远程文件进行汉字转码
Function BytesToBstr(body,Cset)
dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Type = 1
objstream.Mode =3
objstream.Open
objstream.Write body
objstream.Position = 0
objstream.Type = 2
objstream.Charset = Cset
BytesToBstr = objstream.ReadText 
objstream.Close
set objstream = nothing
End Function

Dim word,start,cl,Url, Html, Str_start, Str_end,sfilter

sfilter=request.QueryString("filter")
If sfilter<>"" Then
 sfilter="&filter="+sfilter
Else
	sfilter=""
End If

word=request.QueryString("q")
If word="" Then
	response.Write("<div id=""logo""><img src=""images/biglogo.gif""/></div><div id=""line""></div>")
	Response.write("<div id=""searchIndex""><form method=get action=""search.asp""><input class=""text"" name=q type=text size=""36"" maxlength=""100"" value="&word&"> <input class=""button"" type=""submit"" value=""搜索""></form></div>")
Else
	start=Cint(request.QueryString("start"))
	cl=Cint(request.QueryString("cl"))
	If start="" Then pn=0
	If cl="" Then cl=0
	Dim wordArray,wordNum,wordText,wordCount
	wordArray=Split(word," ")
	wordNum=Ubound(wordArray)
	If wordArray(wordNum)<>site Then
		Url="http://www.google.cn/search?q="&word&"+"&site&"&hl=zh-CN&lr=&newwindow=1&start="&start&"&sa=N"&sfilter&""
	Else
		wordNum=wordNum-1
		Url="http://www.google.cn/search?q="&word&"&hl=zh-CN&lr=&newwindow=1&start="&start&"&sa=N"&sfilter&""
	End If

	wordText=wordArray(0)
	If wordNum>0 Then
		For wordCount=1 To wordNum	
			wordText=wordText+" "+wordArray(wordCount)
		Next
	End If
	response.write("<div class=""site"">站内搜索：</div><div class=""search""><form method=get action=""search.asp""><input class=""text"" name=q type=text size=""30"" maxlength=""100"" value='"&wordText&"'> <input class=""button"" type=""submit"" value=""搜索""></form></div>")

	Html = getHTTPPage(Url) '开始读取远程地址

	'如果找不到相关的网页
	If instr(Html,"找不到和您的查询")<>0 Then
		response.Write("<div class=""info"">有 <b>0</b> 项符<b>"&word&"</b>的查询结果</div>")
		Response.Write("<div class=""notfound"">对不起，找不到与您查询的 <span class=""keywords"">"&word&"</span> 相关的网页<br><br>")
		Response.Write("<b>Fdream 建议您：</b><ul>")
		Response.Write("<li>看看输入的文字是否有误</li><li>请换用另外的查询字词</li><li>请改用较常见的字词</li><li>请减少查询字词的数量</li><li>去掉可能不必要的字词，如“的”、“什么”等</li></ul></div>")	
	Else
		Dim resultNum,resultNumStart,resultNumEnd
		resultNumStart=instr(Html, "有 <b>")
		resultNumEnd= instr(resultNumStart, Html,"</font></td></tr></table>")
		resultNum=Mid(Html,resultNumStart, resultNumEnd-resultNumStart)
		response.Write("<div class=""info"">"&resultNum&"</div>")
		
		'截取搜索结果
		Dim content
		Str_start = instr(Html, "<div><p class=g>")
		Str_end = instr(Str_start, Html,"<br clear=all>")
		content = Mid(Html, Str_start, Str_end - Str_start)
		content = Replace(content,"href=""/search?","href=""search.asp?")
		content = Replace(content,"href=/search?","href=search.asp?")
		content = Replace(content,"color=CC0033","color=#CC0033")
		content = Replace(content,"网页快照","")
		content = Replace(content,"类似网页","")
		response.Write(content)

		'截取搜索结果页码
		Dim page,pageStart,pageEnd
		If instr(Html, "结果页码:")<>0 Then
			pageStart=instr(Html, "结果页码:")
			pageStart=instr(pageStart, Html, "<td nowrap>")
			pageEnd=instr(pageStart, Html,"</table></div><center>")
			page=Mid(Html, pageStart, pageEnd- pageStart)

			'去掉图片
			page = Replace(page,"<img src=/intl/zh-CN/nav_previous.gif width=68 height=26 alt="""" border=0><br>","")
			page = Replace(page,"<img src=/intl/zh-CN/nav_next.gif width=100 height=26 alt="""" border=0><br>","")
			page = Replace(page,"<img src=/intl/zh-CN/nav_first.gif width=18 height=26 alt=""""><br>","")
			page = Replace(page,"<img src=/intl/zh-CN/nav_last.gif width=46 height=26 alt=""""><br>","")
			page = Replace(page,"<img src=/intl/zh-CN/nav_current.gif width=16 height=26 alt=""""><br>","")
			page = Replace(page,"<img src=/intl/zh-CN/nav_page.gif width=16 height=26 alt="""" border=0><br>","")
			page = Replace(page,"href=""/search?q","href=""search.asp?q")
			page = Replace(page,"href=/search?q","href=search.asp?q")
			response.Write("<br><table cellpadding=""6px""><tr>"&page&"</tr></table>")
		End If

	End If
	response.write("<hr noshadow size=""1px"" color=""#3366cc""><div class=""search""><form method=get action=""search.asp""><input class=""text"" name=q type=text	size=""30"" maxlength=""100"" value='"&wordText&"'> <input class=""button"" type=""submit"" value=""搜索""></form></div>")
End If
response.Write("<div class=""foot"">Powered By <a href=""http://www.google.com"">Google</a></div>")
%>
</body>
</html>