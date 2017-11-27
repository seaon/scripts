$VMName = ,"centos"
$PATH = "D:\Program Files (x86)\virtualBox"

$list = & $PATH\VBoxManage list runningvms

if ($list -ne $null){
    $started = [regex]::matches($list, '\"(.*?)\"') | ForEach-Object{$_.Groups[1].Value}
}

function startvm ($VMName){
    if ($VMName -in $started) {
        "The machine '" + $VMName + "' is already started."
    }else{
        & $PATH\VBoxManage startvm $VMName --type headless
    }
}

$VMName | ForEach-Object{startvm $_}
