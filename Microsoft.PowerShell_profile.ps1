Import-Module MyModule

New-Alias -name emacs -value Start-Emacs -description "Launch emacs" -option ReadOnly
New-Alias -name styleguide -value Enter-TeleoptiStyleguide -description "Teleopti Styleguide" -option ReadOnly
New-Alias -name teleopti -value Enter-TeleoptiDebug -description "Teleopti Debug" -option ReadOnly
New-Alias -name wfm -value Enter-TeleoptiWFM -description "Teleopti WFM" -option ReadOnly
New-Alias -name vpn -value Enable-TeleoptiVpn -description "Enable Teleopti VPN" -option ReadOnly
New-Alias -name vpn-off -value Disable-TeleoptiVpn -description "Disable Teleopti VPN" -option ReadOnly
New-Alias -name restore-to-local -value  Start-TeleoptiRestoreToLocal -description "Teleopti Restore to Local" -option ReadOnly
New-Alias -name challenger -value New-TeleoptiChallenger -description "Teleopti Challenger" -option ReadOnly
New-Alias -name devbuild -value New-DevBuild -description "Teleopti Devbuild" -option ReadOnly
New-Alias -name github -value New-GitHub -description "Github" -option ReadOnly
New-Alias -name pull -value Start-TeleoptiSourcePull -description "Pull Teleopti Source Code" -option ReadOnly
New-Alias -name explore -value Select-File -description "Select file in explorer" -option ReadOnly
New-Alias -name find -value Find-HgFile -description "Find Teleopti source file" -option ReadOnly

function Reset-MyModule {
	Remove-Module MyModule
	Import-Module MyModule
}
