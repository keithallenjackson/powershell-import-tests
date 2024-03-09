# PowerShell Import Tests
This is an automated means to check import compatibility between current PowerShell versions and the Microsoft.Bcl.AsyncInterfaces library.

PowerShell Version to bundled Microsoft.Bcl.AsyncInterfaces version results:
[Bcl Version Data](bcl-version-data.csv)

C# PSModule import tests targeting different versions of Microsoft.Bcl.AsyncInterfaces against current versions of PowerShell 7:
[Import Test Results](import-test-results.csv)

## Conclusion
PowerShell 7.4 (.NET 8) bundles an old and deprecated foundational library (Microsoft.Bcl.AsyncInterfaces 5.0.0.0) causing powershell developers to target deprecated, old libraries

PowerShell 7.3 (.NET 7) correctly bundles version 7.0.0.0

PowerShell 7.2 (.NET 6) incorrectly bundles previous version (now deprecated) 5.0.0.0 instead of 6.0.0.0