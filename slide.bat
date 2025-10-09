powershell Start-Sleep -Seconds 5
powershell -windowstyle Minimized -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1 -Uri http://192.168.2.42:4000/slide/?ch=3 -Top 0 -Left 0 -Width 1920 -Height 1080
rem 非表示にしたい場合は
rem powershell -windowstyle hidden -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1