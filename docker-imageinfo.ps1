using namespace System.IO

$versions = get-content ([Path]::Combine($PSScriptRoot, "powershell-versions.txt"))
$imageInfoScriptPath = [Path]::Combine($PSScriptRoot, "imageInfo.ps1")

$data = $versions | ForEach-Object {
    $json = & docker run --rm -v ${imageInfoScriptPath}:/opt/imageInfo.ps1 jakman85/powershell:$_ /opt/microsoft/powershell/7/pwsh -File /opt/imageInfo.ps1
    $json | ConvertFrom-Json
} | Export-Csv ([Path]::Combine($PSScriptRoot, "bcl-version-data.csv")) -NoTypeInformation