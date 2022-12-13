$textToDisplay = $args[0]

# Begin - Kill Existing Processes
$powershellProcesses = Get-WmiObject Win32_Process | Where-Object {$_.Name -like "*Powershell*"}

foreach($powershellProcess in $powershellProcesses)
{
    $commandLine = $powershellProcess.CommandLine

    if($commandLine -like "*createReminder*")
    {
        taskkill /F /PID $powershellProcess.ProcessId
    }
}

# End - Kill Existing Processes

[reflection.assembly]::loadwithpartialname('System.Windows.Forms');

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$screens = [System.Windows.Forms.Screen]::AllScreens
$screenCount = $screens.Count

for($screenIndex = 0; $screenIndex -lt $screenCount; $screenIndex++)
{
    Write-Output "Creating Reminder Window with $textToDisplay on Screen $screenIndex"
    Start-Process -WindowStyle Minimized -FilePath "powershell" -ArgumentList "-file $scriptPath\createReminder.ps1 $screenIndex ""$textToDisplay"""
}
