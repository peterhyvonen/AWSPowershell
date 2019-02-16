$instanceid = curl http://169.254.169.254/latest/meta-data/instance-id
$ipinfo = Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias Ethernet*
$computername = hostname
# $instanceid.content or $ipinfo.IPAddress  or $computername
mkdir C:\gitlab
wget -O C:\gitlab\gitlab-runner.exe https://gitlab-runner-downloads.s3.amazonaws.com/master/binaries/gitlab-runner-windows-amd64.exe
if (Test-Path gitlab-runner.exe) {
    C:\gitlab\gitlab-runner.exe install       
    C:\gitlab\gitlab-runner.exe register --non-interactive --url $env:gitlaburl --registration-token $env:gitlabtoken --description "modulebuilder$instanceid.content" --executor "shell" --tag-list "build,windows"
    Stop-Process gitlab-runner
    Start-Process gitlab-runner
}
else {
    Write-Error "Error Downloading from https://gitlab-runner-downloads.s3.amazonaws.com/master/binaries/gitlab-runner-windows-amd64.exe"
}