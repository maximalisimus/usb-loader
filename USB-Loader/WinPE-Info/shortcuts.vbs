Set objShell = CreateObject("WScript.Shell")

' shortcuts.vbs /source:^"^%SystemDrive^%\Programs\WinXShell-X64\WinXShell.exe" /destination:"%USERPROFILE%\Desktop" /work:"^%SystemDrive^%\Programs\WinXShell-X64\" /name:"WinXShell" /description:"Run WinXShell" /icon:"%SystemDrive%\Programs\WinXShell-X64\WinXShell.exe" /args:"%*"

' shortcuts.vbs /url /source:"https://maximalisimus.github.io/url/" /destination:"%USERPROFILE%\Desktop" /name:"Links"

' ���������, ��� �������� �����-�� ���������
If WScript.Arguments.Count > 0 Then
	Set colArgs = WScript.Arguments.Named
	' �������� ������
	strDescription = colArgs.Item("description")
	' ���� ��� ���������� ������������ ������
	strDestination = colArgs.Item("destination")
	' ���������������� ������ ������������ ������
	strIcon = colArgs.Item("icon")
	' ��� ������������ ������
	strName = colArgs.Item("name")
	' ���� � �������, �� ������� ��������� �����
	strSource = colArgs.Item("source")
	' ������� ����������
	strWork = colArgs.Item("work")
	' ���������
	strArgs = colArgs.Item("args")
	' URL
	' colArgs.Item("url")
	
	if colArgs.Exists("url") Then
		Set objLink = objShell.CreateShortcut(strDestination & "\" & strName & ".url")
		objLink.TargetPath = strSource
		objLink.Save
	Else
		Set objLink = objShell.CreateShortcut(strDestination & "\" & strName & ".lnk")
		' ������������� �������� ������, ������ ���� ����� �������� description
		If 0 < Len(strDescription) Then
			objLink.Description = strDescription
		End If
		' ������������� ���������������� ������, ������ ���� ����� �������� icon
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
