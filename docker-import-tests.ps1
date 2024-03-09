using namespace System.IO

$bclVersions = get-content ([Path]::Combine($PSScriptRoot, "bcl-versions.txt"))
$powershellVersions = get-content ([Path]::Combine($PSScriptRoot, "powershell-versions.txt"))
$importTestScriptPath = [Path]::Combine($PSScriptRoot, "import-tests.ps1")

$powershellVersions | ForEach-Object {
    $psVersion = $_

    $bclVersions | ForEach-Object {
        $bclVersion = $_
        $hostPublishPath = [Path]::Combine($PSScriptRoot, "publish", $bclVersion)
        
        $json = & docker run -v ${hostPublishPath}:/app -v ${importTestScriptPath}:/opt/script.ps1 --rm -e BCL_LIBRARY_VERSION=$bclVersion jakman85/powershell:$psVersion /bin/pwsh -File /opt/script.ps1
        
        $json | ConvertFrom-Json
    }
} | Export-Csv -Path ([Path]::Combine($PSScriptRoot, "import-test-results.csv")) -NoTypeInformation