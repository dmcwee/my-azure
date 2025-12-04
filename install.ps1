param(
    [string]$customModulePath,
    [switch]$force
)

$psm = Get-ChildItem -Path .\my-azure.psm1 -ErrorAction SilentlyContinue
if(($null -eq $psm) -or ($force)) {
    Copy-Item .\my-azure.unsigned.psm1 -Destination .\my-azure.psm1


    $cert = Get-ChildItem -Path Cert:\CurrentUser\My -DnsName my-azure@davidmcwee.com -ErrorAction SilentlyContinue
    if($null -eq $cert) {
        $cert = New-SelfSignedCertificate -DnsName my-azure@davidmcwee.com -Type CodeSigning -CertStoreLocation Cert:\CurrentUser\My
        Export-Certificate -Cert $cert -FilePath my-azure.crt
        Import-Certificate -FilePath .\my-azure.crt -CertStoreLocation Cert:\CurrentUser\Root
    }

    Set-AuthenticodeSignature .\my-azure.psm1 -Certificate $cert
}

$nullOrEmpty = [string]::IsNullOrEmpty($customModulePath)
if ($nullOrEmpty) {
    Write-Debug 'The parameter $customModulePath is null or empty.'
}
else {
    # Create the folder if it doesn't exist
    New-Item -Path $customModulePath -ItemType Directory -Force | Out-Null

    # 1) Persist in user environment (future sessions)
    # setx writes to the user Environment registry and persists after restart/new session
    setx PSModulePath "$($Env:PSModulePath);$customModulePath"

    # 2) Ensure current session picks it up immediately
    $Env:PSModulePath = "$Env:PSModulePath;$customModulePath"

    # 3) Add to your PowerShell profile so any path reset is healed automatically
    #$profileDir = Split-Path -Parent $PROFILE
    #New-Item -Path $profileDir -ItemType Directory -Force | Out-Null
    #'if ($Env:PSModulePath -notlike "*$customModulePath*") { $Env:PSModulePath += ";$customModulePath" }' |
    #Out-File -FilePath $PROFILE -Encoding UTF8 -Append

    # Verify
    # $Env:PS
}