Param(
    [uri] $uri = "https://www.google.co.jp/",
    [Int] $Top = 0,
    [Int] $Left = 0,
    [Int] $Width = 3840,
    [Int] $Height = 1080
)

Add-Type -Assembly System.Windows.Forms
[void][reflection.assembly]::LoadFile((Join-Path $PSScriptRoot "lib\Microsoft.Web.WebView2.WinForms.dll"))
[void][reflection.assembly]::LoadFile((Join-Path $PSScriptRoot "lib\Microsoft.Web.WebView2.Core.dll"))

$form1 = [System.Windows.Forms.Form]@{
    FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::None
    StartPosition = [System.Windows.Forms.FormStartPosition]::Manual
    Top = $Top
    Left = $Left
    Text = 'WebView'
    BackColor  = [System.Drawing.Color]::DimGray
}

$webview = [Microsoft.Web.WebView2.WinForms.WebView2]@{
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