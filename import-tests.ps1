$data = [pscustomobject]@{
    PSVersion = $PSVersionTable.PSVersion.ToString()
    PSModuleBclLibraryVersion = $env:BCL_LIBRARY_VERSION
    ImportSuccess = $true
    ErrorMessage = ""

}

try {
    Import-Module /app/CSharpModule.dll -ErrorAction Stop
}
catch {
    $data.ImportSuccess = $false
    $data.ErrorMessage = $error.Exception.Message
}

$data | ConvertTo-Json