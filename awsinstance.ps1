Import-Module "C:\Program Files (x86)\AWS Tools\PowerShell\AWSPowerShell\AWSPowerShell.psd1"
$img = $env:awsimg
$key = $env:awskey
$sec = $env:awssg
$size = 't2.micro'
$snet = $env:awssub
$r = 'us-west-2'
$p = 'saml'
$tag = "'ResourceType': 'instance','Tags': [{'Key': 'Name','Value': hostname,},}]},])"

New-EC2Instance -ImageId $img  -MinCount 1 -MaxCount 1 -KeyName $key  -SecurityGroupIds $sec -InstanceType $size -SubnetId $snet -Region $r -ProfileName $p -TagSpecifications