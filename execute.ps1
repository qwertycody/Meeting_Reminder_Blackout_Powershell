$textToDisplay = $args

[reflection.assembly]::loadwithpartialname('System.Windows.Forms');

$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$screens = [System.Windows.Forms.Screen]::AllScreens
$screenCount = $screens.Count

$jobList = New-Object System.Collections.ArrayList

for($screenIndex = 0; $screenIndex -lt $screenCount; $screenIndex++)
{
    Write-Output "Creating Reminder Window with $textToDisplay on Screen $screenIndex"
    $job = Start-Job -FilePath "$scriptPath\createReminder.ps1" -ArgumentList $screenIndex, "$textToDisplay"
    $jobList.Add($job)
}

foreach($job in $jobList)
{
    Wait-Job $job
}
