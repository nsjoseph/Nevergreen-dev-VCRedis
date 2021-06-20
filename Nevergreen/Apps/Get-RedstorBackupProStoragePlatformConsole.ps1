$DownloadPageURL = Get-Link -Uri 'https://support.redstor.com/hc/en-gb/sections/200458081-Downloads' -MatchProperty href -Pattern 'Downloads-Redstor-Pro' | Set-UriPrefix -Prefix 'https://support.redstor.com'

$URL32 = Get-Link -Uri $DownloadPageURL -MatchProperty href -Pattern 'RedstorBackupPro-SP-Console'

$Version = $URL32 | Get-Version -Pattern '((?:\d+\.)+\d+)\.exe$'

if ($URL32 -and $Version) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}