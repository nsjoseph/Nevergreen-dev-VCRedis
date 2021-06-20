$URL32 = ((Invoke-WebRequest 'https://support.lenovo.com/gb/en/solutions/hf003321-lenovo-vantage-for-enterprise' -DisableKeepAlive -UseBasicParsing).Content | Select-String -Pattern '.+(https://.+LenovoCommercialVantage_(?:\d+\.)+\d+.+zip)').Matches.Groups.Value | Select-Object -Last 1

$Version = $URL32 | Get-Version

if ($URL32 -and $Version) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}