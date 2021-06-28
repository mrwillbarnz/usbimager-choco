$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'usbimager.portable'
  unzipLocation = Split-Path $MyInvocation.MyCommand.Definition
  url           = 'https://gitlab.com/bztsrc/usbimager/raw/binaries/usbimager_1.0.7-i686-win-gdi.zip'
  checksum      = '610CD3853D968E12E83F331F32A8999E'
  checksumType  = 'sha256'
  Destination   = $toolsDir
}

Get-ChocolateyUnzip @packageArgs @unzipLocation

# Workaround for ShimGen GUI, rather than console variant
Set-Content -Path (Join-Path -Path $toolsDir -ChildPath "usbimager.exe.gui") `
            -Value $null

Remove-Item -force "$toolsDir\*.zip" -ea 0
