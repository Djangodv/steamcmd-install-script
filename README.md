# SteamCMD game installation script

**Disclaimer:** in its current state the code is intended for personal-use only (expect some issues)

This repository contains a small PowerShell script for installing Steam games on a 32-bit operating system (as of January 1 2026 Steam stopped supporting 32-bit operating systems). It uses SteamCMD to download the game files directly to a computer.

## Getting Started

### Setting credentials

Enter your Steam username and password in Windows Credential Manager. This can be done with the following command:

```bash
cmdkey /generic:targetname /user:username /pass:password
```

Then inside `script.ps1` change the below line of and enter the name of your target.

```bash
# Retrieve credentials
$credential = Get-StoredCredential -Target <targetname>
```

## Common Errors

**File cannot be loaded because running scripts is disabled on this system.**

---

Use the below command to temporarily bypass the restrictions set by Windows.

```bash
powershell -ExecutionPolicy Bypass -File script.ps1
```

For a more long-term solution, see: https://lazyadmin.nl/powershell/running-scripts-is-disabled-on-this-system/

**WARNING: Unable to download the list of available providers. Check your internet connection.**

---

Execute this before installing the CredentialManager module in PowerShell:

```bash
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
```

Source: https://stackoverflow.com/a/57696968
