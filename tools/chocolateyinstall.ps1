$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = 'usbimager.portable'
  unzipLocation = Split-Path $MyInvocation.MyCommand.Definition
  url           = 'https://gitlab.com/bztsrc/usbimager/raw/binaries/usbimager_1.0.7-i686-win-gdi.zip'
  checksum      = '610CD3853D968E12E83F331F32A8999E'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.zip
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\