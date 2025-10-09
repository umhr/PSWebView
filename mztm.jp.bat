powershell Start-Sleep -Seconds 5
powershell -windowstyle Minimized -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1 -Uri https://mztm.jp -Top 10 -Left 10 -Width 1420 -Height 900
rem 非表示にしたい場合は
rem powershell -windowstyle hidden -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1