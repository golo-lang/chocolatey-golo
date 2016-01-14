try {
  $package = 'golo'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $binRoot = Get-BinRoot
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'https://bintray.com/artifact/download/golo-lang/downloads/golo-3.1.0-incubation-M1.zip'

  Install-ChocolateyZipPackage 'golo' "$zipUrl" "$binRoot"

  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights

  Write-ChocolateySuccess 'golo'
} catch {
  Write-ChocolateyFailure 'golo' "$($_.Exception.Message)"
  throw
}
