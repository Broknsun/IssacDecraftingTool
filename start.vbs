' Isaac Decrafting Tool - Silent Launcher
' Double-click to start (no console window)

Set WshShell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")

scriptDir = fso.GetParentFolderName(WScript.ScriptFullName)
WshShell.CurrentDirectory = scriptDir

' Check if dist exists, use it for faster startup
distExists = fso.FolderExists(scriptDir & "\dist")

If distExists Then
    ' Production mode: serve dist/ with Python
    WshShell.Run "cmd /c start http://localhost:8080/ && python -m http.server 8080 --directory dist", 0, False
Else
    ' Dev mode: check node_modules, start dev server
    If Not fso.FolderExists(scriptDir & "\node_modules") Then
        MsgBox "Installing dependencies... This may take a moment.", 64, "Isaac Decrafting Tool"
        WshShell.Run "cmd /c cd /d """ & scriptDir & """ && npm install", 0, True
    End If
    WshShell.Run "cmd /c cd /d """ & scriptDir & """ && npm run serve", 0, False
    WScript.Sleep 8000
    WshShell.Run "http://localhost:8080/", 1, False
End If
