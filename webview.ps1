Param(
    [uri] $uri = "https://www.google.co.jp/",
    [Int] $Top = 0,
    [Int] $Left = 0,
    [Int] $Width = 3840,
    [Int] $Height = 1080
)

Add-Type -Assembly System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[void][reflection.assembly]::LoadFile((Join-Path $PSScriptRoot "lib\Microsoft.Web.WebView2.WinForms.dll"))
[void][reflection.assembly]::LoadFile((Join-Path $PSScriptRoot "lib\Microsoft.Web.WebView2.Core.dll"))
[void][reflection.assembly]::Load('System.Drawing, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a')
[void][reflection.assembly]::Load('System.Windows.Forms, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089')
[System.Windows.Forms.Application]::EnableVisualStyles()

$form1 = [System.Windows.Forms.Form]@{
    FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
    StartPosition = [System.Windows.Forms.FormStartPosition]::Manual
    Top = $Top
    Left = $Left
    Text = 'WebView'
    BackColor  = [System.Drawing.Color]::DimGray
}

$webview = [Microsoft.Web.WebView2.WinForms.WebView2]@{
    Location   = New-Object System.Drawing.Point(0, 0)
    Name       = 'webview'
    TabIndex   = 0
    ZoomFactor = 1
    Dock       = [System.Windows.Forms.DockStyle]::Fill
    CreationProperties = New-Object 'Microsoft.Web.WebView2.WinForms.CoreWebView2CreationProperties'
}
$webview.CreationProperties.UserDataFolder = (Join-Path $PSScriptRoot "data")

$form1Loaded = {
    $webview.Source = $uri
    $webview.Visible = $true
}

$form1Unloaded = {
    $form1.remove_Load($form1Loaded)
    $form1.remove_FormClosed($form1Unloaded)
}

$form1.add_Load($form1Loaded)
$form1.add_FormClosed($form1Unloaded)
$form1.SuspendLayout()
$form1.AutoScaleMode = 'Font'
$form1.ClientSize = New-Object System.Drawing.Size($Width, $Height)
$form1.Controls.Add($webview)
$form1.ResumeLayout()

[void]$form1.showDialog()