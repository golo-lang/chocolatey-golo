try {
  $package = 'golo'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $binRoot = Get-BinRoot
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'https://www.eclipse.org/downloads/download.php?file=/golo/golo-3.0.0-incubation.zip&r=1'

  Install-ChocolateyZipPackage 'golo' "$zipUrl" "$binRoot"

  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights

  Write-ChocolateySuccess 'golo'
} catch {
  Write-ChocolateyFailure 'golo' "$($_.Exception.Message)"
  throw
}
