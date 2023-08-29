param(
    [switch]$force
)

$psm = Get-ChildItem -Path .\my-azure.psm1 -ErrorAction SilentlyContinue
if(($null -eq $psm) -or ($force)) {
    Copy-Item .\my-azure.unsigned.psm1 -Destination .\my-azure.psm1

    $cert = Get-ChildItem -Path Cert:\CurrentUser\My -DnsName my-azure@davidmcwee.com -ErrorAction SilentlyContinue
    if(($null -eq $tCert) -or ($force)) {
        $cert = New-SelfSignedCertificate -DnsName my-azure@davidmcwee.com -Type CodeSigning -CertStoreLocation Cert:\CurrentUser\My
        Export-Certificate -Cert $cert -FilePath my-azure.crt
        Import-Certificate -FilePath .\my-azure.crt -CertStoreLocation Cert:\CurrentUser\Root
    }

    Set-AuthenticodeSignature .\my-azure.psm1 -Certificate $cert
}
