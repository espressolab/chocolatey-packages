$ErrorActionPreference = 'Stop';

$softwareName = 'Grok Exporter*'
$packageName  = 'prometheus-grok-exporter'
$url64        = 'https://github.com/fstab/grok_exporter/releases/download/v0.2.8/grok_exporter-0.2.8.windows-amd64.zip'
$checksum64   = 'AA3545C5F818F81F9D24B87B7DC56DA165E51190D4487808EBC209E5E0D5BDAD'

$packageArgs = @{
  softwareName   = $softwareName
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  unzipLocation  =  Split-Path $MyInvocation.MyCommand.Definition
}
Install-ChocolateyZipPackage @packageArgs










    








