param(
  [Alias("c")]
  [Parameter(
    Mandatory,
    Position=0)]
  [string]$guardCode
  # [Alias("g")]
  # [Parameter(
  #   # Mandatory,
  #   Position=1)]
  # [array]$games
)

$installationDirectory = ""
$folderName = ""

# Install module permanently
Install-Module -Name CredentialManager -Force

# Retrieve credentials
$credential = Get-StoredCredential -Target "target"
if ($null -eq $credential) {
	Write-Host "Credential of 'target' not found."
	exit # Exit prematurely
}

# Extract the username and password
$username = $credential.GetNetworkCredential().UserName
$password = $credential.GetNetworkCredential().Password

steamcmd +@sSteamCmdForcePlatformBitness 32 +@sSteamCmdForcePlatformType windows +force_install_dir $($installationDirectory + $folderName) +login $username $password $guardCode +app_update "" validate

# Write-Host "Username: $username"
# Write-Host "Password: $password"
