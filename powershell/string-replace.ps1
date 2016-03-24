
$release = 'foo   Version:    bar'
$release = $release -replace "\s+Version:\s+", ""
Write-Host $release