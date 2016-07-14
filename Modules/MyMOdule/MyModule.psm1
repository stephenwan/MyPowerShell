$TeleoptiDebug = "$Env:Teleopti\.debug-Setup"
$TeleoptiWFM = "$Env:Teleopti\Teleopti.Ccc.Web\Teleopti.Ccc.Web\WFM"
$TeleoptiStyleguide = "$Env:GitRepo\styleguide"
$TeleoptiVpn = "vpn","typhoon"

$Emacs = "C:\Program Files (x86)\GNU\emacs\bin\runemacs.exe"
$Chrome = "C:\Program Files (x86)\Google\Chrome\Application\chrome.exe"


function Start-Emacs {
    if ($args.Length -eq 0) {
        Start-Process $Emacs
    } else {
        $filename = $args[0]
        Start-Process $Emacs -ArgumentList $filename
    }     
}

function Enter-TeleoptiDebug {
    Set-Location $TeleoptiDebug 
}

function Enter-TeleoptiWFM {
    Set-Location $TeleoptiWFM
}

function Enter-TeleoptiStyleguide {
    Set-Location $TeleoptiStyleguide
}

function Get-TeleoptiVpn {
    
    $interfaceAlias = Get-NetIPAddress | ForEach-Object { $_.InterfaceAlias }

    foreach ($item in $TeleoptiVpn) {
        if ($interfaceAlias -contains $item) {
            Write-Host "Current vpn connection is $item."     
            return $item;
        }
    }

    return;   
}

function Disable-TeleoptiVpn {
    $current = Get-TeleoptiVpn
    if ($current -ne $null) { 
        Write-Host "Disconnecting from $current..."       
        rasdial $current /DISCONNECT
    }
}

function Enable-TeleoptiVpn {    
    $vpn = Get-TeleoptiVpn

    if ($vpn -eq $null) {
        Write-Host "No vpn connection is found."
        $retry = 10;
        while ($retry -gt 0) {
            $idx = $retry % $TeleoptiVpn.Length
            $vpn =  $TeleoptiVpn[$idx]
            Write-Host "Attempting to connect to $vpn..."

            $p = Start-Process rasdial $vpn -PassThru -Wait

            if ($p.ExitCode -eq 0) {
                Write-Host "Connected to $vpn."
                return $vpn
            } else {
                Write-Host "Cannot connect to $vpn."
                $retry -= 1
            }
        }
    } else {
        Write-Host "Connected to $vpn."
        return $vpn
    }

    Write-Error "Cannot connect to $TeleoptiVpns within the retry limit."    
}

function Start-TeleoptiRestoreToLocal {
    Enable-TeleoptiVpn
    Write-Host "Starting Teleopti Restore To Local..."
    $p = Start-Process "$TeleoptiDebug\Restore to Local.bat" -Wait
    if ($p.ExitCode -eq 0) {
        Write-Host "Restore to local was completed!"
    } else {
        Write-Error "Restore to local was not completed!"
    }
}

function New-TeleoptiChallenger {
    Enable-TeleoptiVpn
    $url = "http://challenger:8080/Kanban/#/board/0"
    & $Chrome $url
    Write-Host "New challenger started in Chrome."
}

function New-DevBuild {
    Enable-TeleoptiVpn
    $url = "http://devbuild01.toptinet.teleopti.com/project.html?projectId=TeleoptiWFM&tab=projectOverview"
    & $Chrome $url
    Write-Host "New devbuild started in Chrome."
}

function New-GitHub {
    Disable-TeleoptiVpn
    $url = "https://github.com"
    & $Chrome $url
    Write-Host "Github started in Chrome."
}


Export-ModuleMember -Function 'Start-*'
Export-ModuleMember -Function 'Enter-*'
Export-ModuleMember -Function 'Enable-*'
Export-ModuleMember -Function 'Disable-*'
Export-ModuleMember -Function 'Get-TeleoptiVpn'
Export-ModuleMember -Function 'New-*'
Export-ModuleMember -Variable 'Teleopti*'