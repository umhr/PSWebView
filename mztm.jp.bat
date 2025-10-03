# https://www.google.co.jp/
powershell Start-Sleep -Seconds 5
powershell -windowstyle Minimized -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1 -uri https://mztm.jp -Left 1920 -Width 1920 -Top 0 -Height 1080
# 非表示にしたい場合は
# powershell -windowstyle hidden -NoProfile -ExecutionPolicy Unrestricted ./webview.ps1