$CompanyRepo = "$Env:CompanyRepo"
$CompanyRepoUrl = "$Env:CompanyRepoUrl"
$MyRepo = "$Env:MyRepo"
$MyRepoUrl = "$Env:MyRepoUrl"
$IntranetUrl = "$Env:IntranetUrl"
$CompanyBugTrackerUrl = "$Env:CompanyBugTracker"
$CompanyUniversityUrl = "$Env:CompanyUniversity"
$CompanyFairsailUrl = "$Env:FairSailUrl"
$CloudSelfServiceUrl = "$Env:CloudSelfService"
$CloudAWSUrl = "$Env:CloudAWS"


$RunEmacs = " ${env:ProgramFiles(x86)}\GNU\emacs\bin\runemacs.exe"
$RunChrome = " ${env:ProgramFiles(x86)}\Google\Chrome\Application\chrome.exe"


function Start-Emacs {
    if ($args.Length -eq 0) {
        Start-Process $RunEmacs
    } else {
        $filename = $args[0]
        Start-Process $RunEmacs -ArgumentList "--find $filename"
    }
}

function New-CloudSelfServiceWeb {
    & $RunChrome "$CloudSelfServiceUrl"
}

function New-CloudAWSWeb {
    & $RunChrome "$CloudAWSUrl"
}

function New-CompanyFairSailWeb {
    & $RunChrome "$CompanyFairsailUrl"
}

function New-CompanyUniversityWeb {
    & $RunChrome "$CompanyUniversityUrl"
}

function New-CompanyRepoWeb {
    & $RunChrome "$CompanyRepoUrl"
}

function New-IntranetWeb {
    & $RunChrome "$IntranetUrl"
}

function New-CompanyBugTrackerWeb {
    & $RunChrome "$CompanyBugTrackerUrl"
}

function Enter-MyRepo {
    Set-Location $MyRepo
}

function Enter-CompanyRepo {
    Set-Location $CompanyRepo
}

function Enter-Desktop {
    Set-Location ([environment]::GetFolderPath("Desktop"))
}

function Enter-MyDocuments {
    Set-Location ([environment]::GetFolderPath("MyDocument"))
}


function Read-ConsoleColor {
    return @{
        Bg = $host.ui.rawui.BackgroundColor;
        Fg = $host.ui.rawui.ForegroundColor;
    }
}

function Update-ConsoleColor($colors) {
    $host.ui.rawui.BackgroundColor = $colors.Bg
    $host.ui.rawui.ForegroundColor = $colors.Fg
}

function Open-DailyWorkbench {
    $workbenchDir = Join-Path ([environment]::GetFolderPath("MyDocument")) "Workbench"
    $month = [DateTime]::Today.ToString("MMM")
    $day = [DateTime]::Today.ToString("yyyy-MM-dd")
    $container = Join-Path $workbenchDir $month

    if (-not (Test-Path $container)) {
        New-Item -ItemType Directory -Force -Path $container
    }

    $dailyWork = Join-Path $container "$day.org"
    Start-Emacs $dailyWork
}


function New-GitHub {
    $url = "https://github.com"
    & $RunChrome $url
    Write-Host "Github started in Chrome."
}

function Open-file($path) {
    Start-Process explorer.exe -ArgumentList "/select,$path"
}

function Select-File {
    Begin {
        $paths = @()
        foreach ($p in $args) {
            if ([string]::IsNullOrWhiteSpace($p)) {
                return
            }
            $path = Resolve-Path $p
            $paths += "$path"
            open-file -path $path
        }
    }
    Process {
        if ($_ -eq $null) {
            return
        }
        $path = Resolve-Path $_
        $paths += "$path"
        open-file -path $path
    }
    End {
        return $paths
    }
}

function Search-Google {
    & $RunChrome "https://www.google.com/search?q=$args"
}

function Search-Bing {
    & $RunChrome "https://www.bing.com/search?q=$args"
}


Export-ModuleMember -Function 'Start-*'
Export-ModuleMember -Function 'Enter-*'
Export-ModuleMember -Function 'Enable-*'
Export-ModuleMember -Function 'Disable-*'
Export-ModuleMember -Function 'Get-TeleoptiVpn'
Export-ModuleMember -Function 'New-*'
Export-ModuleMember -Function 'Select-*'
Export-ModuleMember -Function 'Find-*'
Export-ModuleMember -Function 'Search-*'
Export-ModuleMember -Function 'hide-*'
Export-ModuleMember -Function 'Show-*'
Export-ModuleMember -Function 'Open-*'
Export-ModuleMember -Function 'Read-*'
Export-ModuleMember -Function 'Update-*'
Export-ModuleMember -Variable 'Teleopti*'
Export-ModuleMember -Variable 'Run*'
