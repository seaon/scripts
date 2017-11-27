Set-Alias vi  "C:/Program Files/Git/usr/bin/vim.exe"

# 加载PSReadline
Import-Module PSReadline
Set-PSReadlineOption -EditMode Emacs


cd E:
. "$home\Documents\WindowsPowerShell\library.ps1"

$workPath = "E:\git\"

function currentPath {
    if ($pwd.ProviderPath -eq $HOME)
    {
        return '~'
    }
    $path = $pwd.ProviderPath.Split('\')[-1]
    if (!$path)
    {
        return $pwd.Drive.Name + ":"
    }
    return $path
}

# 修改提示符
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    
    Write-Host(currentPath) -NoNewline -ForegroundColor Green

    $global:LASTEXITCODE = $realLASTEXITCODE
    return " $([char]0x3BB) "
}