Set-PSReadLineOption -EditMode Emacs

# Ref: https://github.com/gokcehan/lf/blob/master/etc/lf.ps1
# Change working dir in powershell to last dir in lf on exit.
#
# You need to put this file to a folder in $ENV:PATH variable.
#
# You may also like to assign a key to this command:
#
#     Set-PSReadLineKeyHandler -Chord Ctrl+o -ScriptBlock {
#         [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
#         [Microsoft.PowerShell.PSConsoleReadLine]::Insert('lfcd.ps1')
#         [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
#     }
#
# You may put this in one of the profiles found in $PROFILE.

$ENV:STARSHIP_CONFIG = "$HOME\.dotfiles\.config\starship.toml"
$ENV:EDITOR = "nvim"

function lf {
    $tmp = [System.IO.Path]::GetTempFileName()
    & "C:\ProgramData\chocolatey\bin\lf.exe" -last-dir-path="$tmp" $args
    if (Test-Path -PathType Leaf "$tmp") {
        $dir = Get-Content "$tmp"
        Remove-Item -Force "$tmp"
        if (Test-Path -PathType Container "$dir") {
            if ("$dir" -ne "$pwd") {
                cd "$dir"
            }
        }
    }
}
function myexit {
    Invoke-command -ScriptBlock {exit}
}
function ssh-copy-id {
    param(
        [string]$command
    )
	Invoke-Expression "cat ~/.ssh/id_rsa.pub | ssh $command 'mkdir -p ~/.ssh && cat >> ~/.ssh/authorized_keys'"
}
function aim {
    nvim -u ~/.vimrc $args
}
Set-Alias lg lazygit
Set-Alias :q myexit
Set-Alias :qa myexit
Set-Alias py python

Invoke-Expression (&starship init powershell)

$localpwshrc = "$HOME\.pwshrc.localhost.ps1"
if (Test-Path $localpwshrc) { . $localpwshrc }
