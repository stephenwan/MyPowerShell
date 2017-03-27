Import-Module MyModule

New-Alias -name run -value Start-Process -description "Start process" -option ReadOnly
New-Alias -name emacs -value Start-Emacs -description "Launch emacs" -option ReadOnly
New-Alias -name github -value New-GitHub -description "Github" -option ReadOnly
New-Alias -name explore -value Select-File -description "Select file in explorer" -option ReadOnly
New-Alias -name find -value Find-HgFile -description "Find Teleopti source file" -option ReadOnly
New-Alias -name google -value Search-Google -description "Search with Google" -option ReadOnly
New-Alias -name bing -value Search-Bing -description "Search with Bing" -option ReadOnly
New-Alias -name desktop -value Enter-Desktop -description "Desktop" -option ReadOnly
New-Alias -name documents -value Enter-MyDocuments -description "My Documents" -option ReadOnly
New-Alias -name daily -value Open-DailyWorkbench -description "Open daily workbench" -option ReadOnly
New-Alias -name myrepo -value Enter-MyRepo -description "Goto repo" -option ReadOnly
New-Alias -name crepo -value Enter-CompanyRepo -description "Goto company repo" -option ReadOnly
New-Alias -name crepoweb -value New-CompanyRepoWeb -description "Goto company repo web" -option ReadOnly
New-ALias -name intranet -value New-IntranetWeb -description "Goto company intranet web" -option ReadOnly

function Update-MyModule {
    Remove-Module MyModule
    Import-Module MyModule
}
