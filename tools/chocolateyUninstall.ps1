try {
  $package = 'golo-2.0.0'
  $binRoot = Get-BinRoot
  ### Using an environment variable to to define the bin root until we implement configuration ###
  if($env:chocolatey_bin_root -ne $null){$binRoot = join-path $env:systemdrive $env:chocolatey_bin_root}
  $installDir = Join-Path $binRoot $package

  Remove-Item -Path "$installDir" -Force -Recurse

  Write-ChocolateySuccess 'golo'
} catch {
  Write-ChocolateyFailure 'golo' "$($_.Exception.Message)"
  throw 
}
