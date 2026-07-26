#Requires -Modules CredentialManager

param(
  [Alias("c")]
  [Parameter(
    Mandatory,
    Position=0)]
  [string]$guardCode,
  [Alias("id")]
  [Parameter(
    Mandatory,
    Position=1)]
  [int]$appId,
	[Alias("n")]
	[Parameter(
		Mandatory,
		Position=2)]
	[string]$folderName
)

$installationDirectory = ""

Write-Host "The default installation directory is set to $installationDirectory."

# Retrieve credentials
$credential = Get-StoredCredential -Target <targetname>

if ($null -eq $credential) {
	Write-Host "Credentials of 'target' not found."
	exit # Exit prematurely
}

# Extract the username and password
$username = $credential.GetNetworkCredential().UserName
$password = $credential.GetNetworkCredential().Password

.\steamcmd +@sSteamCmdForcePlatformBitness 32 +@sSteamCmdForcePlatformType windows +force_install_dir $($installationDirectory + $folderName) +login $username $password $guardCode +app_update $appId validate +quit
