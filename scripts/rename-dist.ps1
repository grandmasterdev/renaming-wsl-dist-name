echo "Retreving the default distribution ID..."

$DefaultDistId = Get-ItemPropertyValue 'HKCU:HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss' -Name DefaultDistribution

echo "Id: $DefaultDistId"

$DistName = Get-ItemPropertyValue "HKCU:HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\$DefaultDistId" -Name DistributionName

echo "Current Name: $DistName"

if ( $DistName )
{
    $NewDistName = Read-host -Promp "New Distribution Name "

    echo "User input $NewDistName"
    
    Set-ItemProperty "HKCU:HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Lxss\$DefaultDistId" -Name DistributionName -Value $NewDistName

    wsl --shutdown

    wsl
}

Read-host -Prompt "Press Enter to exit"