# Get the mode from ADM (Light or Dark)
$TargetMode = $args[0] 

$DesktopPath = [System.Environment]::GetFolderPath("Desktop")
$LogFile = Join-Path $DesktopPath "minibin_debug.txt"

"--- MiniBin Command Mode ($(Get-Date)) ---" | Out-File $LogFile

function Write-Log($Message) {
    $Msg = "[$(Get-Date -Format 'HH:mm:ss')] $Message"
    $Msg | Out-File $LogFile -Append
}

try {
    $BinPath = Join-Path $env:APPDATA "MiniBin"
    
    # 1. Logic Check
    if ($TargetMode -eq "Light") {
        $FolderName = "Black"
        Write-Log "ADM signal: Light. Applying Black icons."
    } else {
        $FolderName = "White"
        Write-Log "ADM signal: Dark. Applying White icons."
    }

    $Source = Join-Path $PSScriptRoot "icons\$FolderName"

    # 2. Kill and Clear
    if (Get-Process "MiniBin" -ErrorAction SilentlyContinue) {
        Stop-Process -Name "MiniBin" -Force
        Start-Sleep -Milliseconds 800 # Slightly longer to ensure file handles release
    }

    if (Test-Path $Source) {
        # DELETE ALL existing icons in the MiniBin folder to clear the cache
        Get-ChildItem -Path $BinPath -Filter "*.ico" | Remove-Item -Force

        # 3. Copy the full set
        Copy-Item -Path "$Source\*.ico" -Destination $BinPath -Force
        
        Write-Log "Full icon set ($FolderName) applied to $BinPath"
    }

    # 4. Restart
    Start-Process -FilePath "$BinPath\MiniBin.exe"
    Write-Log "MiniBin Online."

} catch {
    Write-Log "ERROR: $($_.Exception.Message)"
}