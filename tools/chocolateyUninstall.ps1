try {
  $package = 'golo'
  $binRoot = Get-BinRoot
  $installDir = Join-Path $binRoot $package

  Remove-Item -Path "$installDir" -Force -Recurse
} catch {
  throw $_.Exception
}
