$ErrorActionPreference = 'Stop';

$softwareName = 'Prometheus SQL Exporter*'
$packageName  = 'prometheus-sql-exporter'
$url32        = 'https://github.com/free/sql_exporter/releases/download/0.5/sql_exporter-0.5.windows-386.tar.gz'
$url64        = 'https://github.com/free/sql_exporter/releases/download/0.5/sql_exporter-0.5.windows-amd64.tar.gz'
$checksum32   = 'C3C294B9639029A0E56F7A009FB259CA2FDC66667CF9FBD8AA4D6D6D47D67290'
$checksum64   = 'DFA06EEB3573C1C0E6AC03C54A8CE3C86F99035A3D3EFC3CBDD5DAD6C10F3118'

$packageArgs = @{
  softwareName   = $softwareName
  packageName    = $packageName
  fileType       = 'EXE'
  url            = $url32  
  url64bit       = $url64
  checksum       = $checksum32  
  checksum64     = $checksum64
  checksumType   = 'sha256'  
  checksumType64 = 'sha256'
  unzipLocation  =  Split-Path $MyInvocation.MyCommand.Definition
}
Install-ChocolateyZipPackage @packageArgs
$File = Get-ChildItem -File -Path $env:ChocolateyInstall\lib\$packageName\tools\ -Filter *.tar
Get-ChocolateyUnzip -fileFullPath $File.FullName -destination $env:ChocolateyInstall\lib\$packageName\tools\










    








