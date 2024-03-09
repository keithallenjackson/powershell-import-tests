using namespace System.IO

$BCLVersions = get-content (Join-Path $PSScriptRoot bcl-versions.txt)
$CSProjPath = [Path]::Combine($PSScriptRoot, "CSharpModule", "CSharpModule.csproj")

# Build all the different versions of the module targeting different Microsoft.Bcl.AsyncInterfaces versions

foreach ($bclVersion in $BCLVersions)
{
    $env:BCLAI_VERSION = $bclVersion
    $OutputPath = [Path]::Combine($PSScriptRoot, "publish", $bclVersion)

    & dotnet clean $CSProjPath
    & dotnet build $CSProjPath
    & dotnet publish $CSProjPath -o $OutputPath
}