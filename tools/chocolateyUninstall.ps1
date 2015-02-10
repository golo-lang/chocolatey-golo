try {
  $package = 'golo'
  $binRoot = Get-BinRoot
  $installDir = Join-Path $binRoot $package

  Remove-Item -Path "$installDir" -Force -Recurse

  Write-ChocolateySuccess 'golo'
} catch {
  Write-ChocolateyFailure 'golo' "$($_.Exception.Message)"
  throw 
}
