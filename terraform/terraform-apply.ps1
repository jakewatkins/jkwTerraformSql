#
#
#

terraform apply -auto-approve  

$myIp = Invoke-RestMethod -Uri ('https://ipinfo.io/ip')

new-azsqlserverfirewallrule -ResourceGroupName "rgp-usw1-configr1-dev" -ServerName "srv-usw1-configr1-dev" -FirewallRuleName "AllowMyIP" -StartIpAddress $myIp -EndIpAddress $myIpcd 