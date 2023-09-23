$logFilePath = "C:\RRPG\Projetos\RRPG\Kitsune\src\compile_log.txt"
$alertsFilePath = "C:\RRPG\Projetos\RRPG\Kitsune\src\alerts_log.txt"
$srcPath = "C:\RRPG\Projetos\RRPG\Kitsune\src"

# Change to the "src" folder
Set-Location -Path $srcPath

# Remove the existing log file, if it exists
Remove-Item -Path $logFilePath -Force

# Start capturing all output, including formatting, to the main log file
Start-Transcript -Path $logFilePath

# Run the "rdk i" command and capture all output
rdk i

# Stop capturing output
Stop-Transcript

# Define a regular expression pattern to match alert lines
$pattern = "Alertas para|linha \d+, coluna \d+: \d+ - .*"

# Extract lines matching the pattern and save them to the alerts log file
Get-Content $logFilePath | Where-Object { $_ -match $pattern } | Out-File -FilePath $alertsFilePath

# Display a message indicating the completion of the command
Write-Host "Alerts extracted and saved to: $alertsFilePath"

# Add a pause to keep the PowerShell window open
Pause