$Version = (Invoke-WebRequest 'https://www.microsoft.com/en-us/download/details.aspx?id=58158' -UseBasicParsing).Content | Get-Version -Pattern 'Version:\s+</div><p>((?:\d+\.)+\d+)'
$URL32 = Get-Link -Uri 'https://www.microsoft.com/en-us/download/confirmation.aspx?id=58158' -MatchProperty href -Pattern '\.msi$'

if ($Version -and $URL32) {
    [PSCustomObject]@{
        Version      = $Version
        Architecture = 'x86'
        URI          = $URL32
    }
}