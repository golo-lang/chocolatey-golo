try {
  $package = 'golo-1.1.0'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)" 
  $binRoot = Get-BinRoot
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'http://search.maven.org/remotecontent?filepath=org/golo-lang/golo/2.0.0/golo-2.0.0-distribution.zip'

  Install-ChocolateyZipPackage 'golo' "$zipUrl" "$binRoot"
  
  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights

  Write-ChocolateySuccess 'golo'
} catch {
  Write-ChocolateyFailure 'golo' "$($_.Exception.Message)"
  throw 
}
