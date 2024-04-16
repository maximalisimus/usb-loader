Set objShell = CreateObject("WScript.Shell")

' shortcuts.vbs /source:^"^%SystemDrive^%\Programs\WinXShell-X64\WinXShell.exe" /destination:"%USERPROFILE%\Desktop" /work:"^%SystemDrive^%\Programs\WinXShell-X64\" /name:"WinXShell" /description:"Run WinXShell" /icon:"%SystemDrive%\Programs\WinXShell-X64\WinXShell.exe" /args:"%*"

' shortcuts.vbs /url /source:"https://maximalisimus.github.io/url/" /destination:"%USERPROFILE%\Desktop" /name:"Links"

' Проверяем, что получили какие-то параметры
If WScript.Arguments.Count > 0 Then
	Set colArgs = WScript.Arguments.Named
	' Описание ярлыка
	strDescription = colArgs.Item("description")
	' Путь для сохранения создаваемого ярлыка
	strDestination = colArgs.Item("destination")
	' Пользовательский значок создаваемого ярлыка
	strIcon = colArgs.Item("icon")
	' Имя создаваемого ярлыка
	strName = colArgs.Item("name")
	' Путь к объекту, на который ссылается ярлык
	strSource = colArgs.Item("source")
	' Рабочая директория
	strWork = colArgs.Item("work")
	' Аргументы
	strArgs = colArgs.Item("args")
	' URL
	' colArgs.Item("url")
	
	if colArgs.Exists("url") Then
		Set objLink = objShell.CreateShortcut(strDestination & "\" & strName & ".url")
		objLink.TargetPath = strSource
		objLink.Save
	Else
		Set objLink = objShell.CreateShortcut(strDestination & "\" & strName & ".lnk")
		' Устанавливаем описание ярлыка, только если задан аргумент description
		If 0 < Len(strDescription) Then
			objLink.Description = strDescription
		End If
		' Устанавливаем пользовательский значок, только если задан аргумент icon
		If 0 < Len(strIcon) Then
			objLink.IconLocation = strIcon
		End If
		objLink.TargetPath = strSource
		if 0 < Len(strWork) Then
			objLink.WorkingDirectory = strWork
		End if
		if 0 < Len(strArgs) Then
			objLink.Arguments = strArgs
		End if
		objLink.Save
	End if
End If
