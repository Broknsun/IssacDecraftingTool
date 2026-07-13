Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

' Get script directory
scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)
WshShell.CurrentDirectory = scriptDir

' Check Node.js
On Error Resume Next
WshShell.Run "cmd /c where node >nul 2>nul", 0, True
If Err.Number <> 0 Or WshShell.Run("cmd /c where node >nul 2>nul", 0, True) <> 0 Then
    MsgBox "Node.js not found! Please install from https://nodejs.org/", 48, "Isaac Decrafting Tool"
    WScript.Quit 1
End If
On Error GoTo 0

' Install deps if needed
If Not fso.FolderExists(scriptDir & "\node_modules") Then
    MsgBox "Installing dependencies (first run)... This may take a moment.", 64, "Isaac Decrafting Tool"
    WshShell.Run "cmd /c cd /d """ & scriptDir & """ && npm install", 0, True
End If

' Start server silently
WshShell.Run "cmd /c cd /d """ & scriptDir & """ && npm run serve", 0, False

' Wait for server
WScript.Sleep 8000

' Open browser
WshShell.Run "http://localhost:8080/", 1, False
