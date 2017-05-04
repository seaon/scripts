$VMName = "centos"
$PATH = "D:\Program Files (x86)\virtualBox"

$list = & $PATH\VBoxManage list runningvms
$started = [regex]::matches($list, '\"(.*?)\"') | %{$_.Groups[1].Value}

if ($VMName -in $started) {
    "The machine " + $VMName + " is already started."
}else{
    & $PATH\VBoxManage startvm $VMName --type headless
}
