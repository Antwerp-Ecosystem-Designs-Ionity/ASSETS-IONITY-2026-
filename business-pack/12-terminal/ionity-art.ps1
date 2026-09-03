# AEDI terminal-art player (PowerShell). Policy 986 AED | (c) 2018-2026 Ionity (Pty) Ltd
param([string]$Mode="motd",[string]$Name="ionity-global-logo-primary")
$D = Split-Path (Split-Path $MyInvocation.MyCommand.Path)
$OutputEncoding = [Console]::OutputEncoding = [Text.Encoding]::UTF8
$cols = $Host.UI.RawUI.WindowSize.Width
$pick = @(160,100,80,60,40) | Where-Object { $_ -le $cols } | Select-Object -First 1
if (-not $pick) { $pick = 40 }
switch ($Mode) {
  "motd"   { Get-Content "$D/banners/ionity-motd.ans" -Raw | Write-Host }
  "banner" { Get-Content "$D/banners/ionity-global-banner.ans" -Raw | Write-Host
             Get-Content "$D/banners/signature-block.ans" -Raw | Write-Host }
  "list"   { Get-ChildItem "$D/logos/*.ans" | ForEach-Object { $_.BaseName -replace '-\d+col$','' } | Sort-Object -Unique }
  "logo"   { $f="$D/logos/$Name-${pick}col.ans"
             if (-not (Test-Path $f)) { $f = (Get-ChildItem "$D/logos/$Name-*.ans" | Select-Object -First 1).FullName }
             if ($f) { Get-Content $f -Raw | Write-Host } else { Write-Error "no art for $Name" } }
}
