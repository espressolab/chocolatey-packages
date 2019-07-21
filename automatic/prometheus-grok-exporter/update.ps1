import-module au

[Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
$ProgressPreference = 'SilentlyContinue'
$releases = 'https://github.com/fstab/grok_exporter/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    $webResponse = Invoke-WebRequest -Uri $releases -UseBasicParsing
    
    #tidy-5.1.25-win64.zip
    #grok_exporter-0.2.8.windows-amd64.zip
    $re  = 'grok_exporter-.+\.windows-amd64.zip'
    $url = $webResponse.links | Where-Object href -match $re | Select-Object -First 1 -expand href
    
    $url -match 'grok_exporter-(?<version>\d+\.\d+\.\d+)'
    $version = $Matches.version
    $url64 = 'https://github.com' + $url

    $Latest = @{ URL64 = $url64; Version = $version }
    return $Latest
}

update
