<%
	dim fs,filename,txt,content,total,counter_lenth
	counter_lenth=1  '设置显示数据的最小长度，如果小于实际长度则以实际长度为准
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	filename=server.MapPath("count.txt")
	if not fs.FileExists(filename) then
		fs.CreateTextFile filename,True,True
		set txt=fs.OpenTextFile(filename,2,true)
		txt.write 0 '如不存在保存数据的文件则创建新文件并写入数据0
		set fs=nothing
	end if
	
	set txt=fs.OpenTextFile(filename)
	If txt.AtEndOfStream Then
		Application("Counter")=0 '如果文件中没有数据，则初始化Application("Counter")的值（为了容错）
	else
		Application("Counter")=txt.readline
	end if

  Application.Lock 
  Application("Counter") = Application("Counter") + 1
  Application.UnLock
  

  Function save_ '保存计数函数
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	filename=server.MapPath("count.txt")
	content=Application("Counter")
	set txt=fs.OpenTextFile(filename,2,true)
	txt.write content
	set fs=nothing
  End Function

  save_  '调用保存函数保存数据

  Function Digital ( counter )  '显示数据函数
    Dim i,MyStr,sCounter
     sCounter = CStr(counter)
    For i = 1 To counter_lenth - Len(sCounter)
      MyStr = MyStr & "0"
	  'MyStr = MyStr & "<IMG SRC=改成你自己的图片存放的相对目录\0.gif>" '如有图片，可用此语句调用
    Next
    For i = 1 To Len(sCounter)
      MyStr = MyStr & Mid(sCounter, i, 1)
	  'MyStr = MyStr & "<IMG SRC=改成你自己的图片存放的相对目录\" & Mid(sCounter, i, 1) & ".gif>" '如有图片，可用此语句调用
    Next
    Digital = MyStr
  End Function

  Function read_  '读取计数函数
	set fs=Server.CreateObject("Scripting.FileSystemObject")
	filename=server.MapPath("count.txt")
    set txt=fs.opentextfile(filename,1,true)
	total=txt.readline
	response.write total
	set fs=nothing
  End Function

%>