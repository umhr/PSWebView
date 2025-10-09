powershell Start-Sleep -Seconds 5
powershell -windowstyle Minimized -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1 -Uri https://yahoo.co.jp -Top 0 -Left 10 -Width 1620 -Height 800
rem 非表示にしたい場合は
rem powershell -windowstyle hidden -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1