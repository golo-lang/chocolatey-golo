try {
  $package = 'golo'
  $checksum = 'BF61B5A2565C31ED39829453D2C129C4604EFAAC6F6A7E546D199EC82E9EC654'

  $installDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
  $binRoot = Get-BinRoot
  $installDir = Join-Path $binRoot $package
  Write-Host "Adding `'$installDir`' to the path and the current shell path"
  $zipUrl = 'https://bintray.com/artifact/download/golo-lang/downloads/golo-3.2.0.zip'

  Install-ChocolateyZipPackage `
      -PackageName $package `
      -Url $zipUrl `
      -UnzipLocation $binRoot `
      -Checksum $checksum `
	    -ChecksumType 'sha256'
      
  Install-ChocolateyPath "$installDir\bin" 'User' # Machine will assert administrative rights
} catch {
  throw $_.Exception
}
