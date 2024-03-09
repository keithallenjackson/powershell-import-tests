$pwshPath = (Get-Command pwsh).Path
$pwshDir = [System.IO.Path]::GetDirectoryName($pwshPath)
$bclDllPath = [System.IO.Path]::Combine($pwshDir, "Microsoft.Bcl.AsyncInterfaces.dll")

Add-Type -Path $bclDllPath

$assembly = [System.AppDomain]::CurrentDomain.GetAssemblies() | where { $_.Location -eq $bclDllPath }

$data = [pscustomobject]@{
    FrameworkVersion = $([System.Runtime.InteropServices.RuntimeInformation]::FrameworkDescription)
    BclVersion = $assembly.FullName
    PSVersion = $PSVersionTable.PSVersion.ToString()
}

$data | ConvertTo-Json