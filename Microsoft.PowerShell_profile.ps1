Import-Module MyModule

New-Alias -name run -value Start-Process -description "Start process" -option ReadOnly
New-Alias -name emacs -value Start-Emacs -description "Launch emacs" -option ReadOnly
New-Alias -name styleguide -value Enter-TeleoptiStyleguide -description "Teleopti Styleguide" -option ReadOnly
New-Alias -name teleopti -value Enter-TeleoptiDebug -description "Teleopti Debug" -option ReadOnly
New-Alias -name wfm -value Enter-TeleoptiWFM -description "Teleopti WFM" -option ReadOnly
New-Alias -name vpn -value Enable-TeleoptiVpn -description "Enable Teleopti VPN" -option ReadOnly
New-Alias -name vpn-off -value Disable-TeleoptiVpn -description "Disable Teleopti VPN" -option ReadOnly
New-Alias -name restore -value  Start-TeleoptiRestoreToLocal -description "Teleopti Restore to Local" -option ReadOnly
New-Alias -name challenger -value New-TeleoptiChallenger -description "Teleopti Challenger" -option ReadOnly
New-Alias -name devbuild -value New-DevBuild -description "Teleopti Devbuild" -option ReadOnly
New-Alias -name github -value New-GitHub -description "Github" -option ReadOnly
New-Alias -name pull -value Start-TeleoptiSourcePull -description "Pull Teleopti Source Code" -option ReadOnly
New-Alias -name explore -value Select-File -description "Select file in explorer" -option ReadOnly
New-Alias -name find -value Find-HgFile -description "Find Teleopti source file" -option ReadOnly
New-Alias -name build -value Start-TeleoptiBuild -description "Build Teleopti solution" -option ReadOnly
New-Alias -name google -value Search-Google -description "Search with Google" -option ReadOnly
New-Alias -name bing -value Search-Bing -description "Search with Bing" -option ReadOnly
New-Alias -name desktop -value Enter-Desktop -description "Desktop" -option ReadOnly
New-Alias -name documents -value Enter-MyDocuments -description "My Documents" -option ReadOnly
New-Alias -name daily -value Open-DailyWorkbench -description "Open daily workbench" -option ReadOnly
New-Alias -name door-open -value Open-Door -description "Zhima Kai Men" -option ReadOnly
New-Alias -name repo -value Enter-Repo -description "Goto repo" -option ReadOnly


function Update-MyModule {
    Remove-Module MyModule
    Import-Module MyModule
}
