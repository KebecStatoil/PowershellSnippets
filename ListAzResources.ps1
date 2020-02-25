Get-AzSubscription # List out your available subscriptions
Set-AzContext 4bb8df6f-e5b7-45f8-8db6-22ec061d6938 # set the one you want to work in
(Get-AzContext).name # check that it's the one that your mean ^^)
Get-AzResource -ResourceGroupName ngrmdfvtrgdev # blast out the resources
Get-AzResource -ResourceGroupName ngrmdfvtrgdev | ForEach-Object { "We've got a {0}, which is a {1}" -f $_.Name, $_.Type } # map the resource details that you want
