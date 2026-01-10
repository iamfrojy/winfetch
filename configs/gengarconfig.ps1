# MADE BY FROJY :)

$ErrorActionPreference = "SilentlyContinue"

$esc = [char]27

$purple = "$esc[38;2;186;85;211m"
$reset  = "$esc[0m"

function SafeValue($v,$d="Unknown"){ if($null -eq $v -or $v -eq ""){$d}else{$v} }

$user  = SafeValue $env:USERNAME
$hostn = SafeValue $env:COMPUTERNAME

$os  = Get-CimInstance Win32_OperatingSystem
$cpu = Get-CimInstance Win32_Processor | Select-Object -First 1
$gpu = Get-CimInstance Win32_VideoController | Select-Object -First 1

$totalMem = [math]::Round($os.TotalVisibleMemorySize / 1MB, 1)
$freeMem  = [math]::Round($os.FreePhysicalMemory / 1MB, 1)

$disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$diskTotal = [math]::Round($disk.Size / 1GB, 1)
$diskFree  = [math]::Round($disk.FreeSpace / 1GB, 1)
$diskUsed  = [math]::Round($diskTotal - $diskFree, 1)

$ShellName = if ($PSVersionTable) { "PowerShell $($PSVersionTable.PSVersion)" } else { "Command Prompt" }
$ShellName = if ($env:ComSpec -match "cmd.exe") { "Command Prompt" } else { $ShellName }

$batt = Get-CimInstance Win32_Battery
if ($batt) {
    $batteryInfo = "$($batt.EstimatedChargeRemaining)%"
} else {
    $batteryInfo = "N/A"
}

$logo = @(
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⢳⣤⡀⠀⠀⠀⢸⢳⣄⠀⠀⢰⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣾⣿⣿⣦⣽⣦⣼⢸⣿⣷⣦⡟⣿⡄⠀⡄⠀⠀⢀⣠⣴⣾⠋⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⠀⢶⢶⢤⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⢧⠴⣚⣽⣿⣿⠃⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⢠⣤⣬⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣾⣿⣿⣿⠃⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠀⣨⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⢿⣿⣿⡿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⢀⣠⣖⣫⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣻⣿⣿⣟⣿⣿⣿⡿⣿⣿⣯⣱⠦⣄⠀⠀⠀⠀",
"⠀⣀⣴⣫⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢏⣿⣿⣿⣯⣿⣿⣿⡟⣼⣿⣿⣿⣿⣿⣮⡳⣄⠀⠀",
"⠚⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⣿⣿⣾⣾⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣾⣦⠀",
"⠰⠟⣿⣛⣉⣛⢿⣿⣿⣿⣿⣿⣿⣿⣇⠀⡝⠛⠻⡿⠿⠿⡿⠿⢻⠋⣏⣼⣿⡿⠛⠻⠿⣿⣿⡟⠂",
"⠀⠀⠈⠻⣶⣾⣿⢋⣾⣿⣿⢿⣿⣿⣿⣦⡅⠀⠀⡇⠀⢀⠇⠀⣌⣴⣿⣿⣿⠇⠀⠀⠀⠈⠉⠁⠀",
"⠀⠀⠀⠀⠙⢻⣇⣿⣿⣿⡿⣿⣻⣯⣿⣿⣿⣶⣤⣧⣤⣼⣤⣾⣿⣿⣿⣿⡟⢦⠀⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⡞⣼⣿⣿⣷⣿⣿⣿⣿⡿⣷⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣻⣿⣿⣏⣧⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⣷⢸⣿⣿⣾⣿⣽⣿⠷⢿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⠟⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⢠⣟⣰⣿⣯⣷⠟⠋⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠙⠻⢿⡿⡿⠿⡄⠀⠀⠀⠀⠀⠀",
"⠀⠀⠀⠀⠀⠀⠛⠙⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀"
)

$info = @(
"User:     $user@$hostn",
"OS:       $($os.Caption)",
"CPU:      $($cpu.Name)",
"GPU:      $($gpu.Name)",
"Memory:   $freeMem GB Free / $totalMem GB",
"Disk:     $diskUsed GB Used / $diskTotal GB",
"Shell:    $ShellName",
"Battery:  $batteryInfo"
)

$maxLines = [Math]::Max($logo.Count, $info.Count)
$logoWidth = ($logo | Measure-Object Length -Maximum).Maximum + 2

for ($i = 0; $i -lt $maxLines; $i++) {

    if ($i -lt $logo.Count) {
        Write-Host "$purple$($logo[$i])$reset" -NoNewline
        $lineLength = $logo[$i].Length
        Write-Host (" " * ($logoWidth - $lineLength)) -NoNewline
    } else {
        Write-Host (" " * $logoWidth) -NoNewline
    }

    if ($i -lt $info.Count) {
        $parts = $info[$i] -split ":",2
        if ($parts.Count -eq 2) {
            Write-Host "$purple$($parts[0]):$reset" -NoNewline
            Write-Host "$($parts[1])"
        } else {
            Write-Host $info[$i]
        }
    } else {
        Write-Host ""
    }
}
