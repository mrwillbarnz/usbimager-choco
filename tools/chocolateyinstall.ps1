$ErrorActionPreference = 'Stop'
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = 'usbimager.portable'
  unzipLocation = '$toolsDir\imager.zip'
  file          = "$toolsDir\imager.zip"
  Destination   =  $toolsDir
  checksum      = '610CD3853D968E12E83F331F32A8999E'
  checksumType  = 'sha256'
  SpecificFolder = 'USBImager'
}

Get-ChocolateyUnzip @packageArgs

Set-Content -Path (Join-Path -Path $toolsDir -ChildPath "usbimager.exe.gui") `
            -Value $null

Remove-Item -force "$toolsDir\*.zip" -ea 0
