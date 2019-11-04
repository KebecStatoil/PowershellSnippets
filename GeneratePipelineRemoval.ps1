$SolutionPath = "C:\Users\kebec\Documents\GitHub\DataLakers\projects\SafranProject\5.0"

$StopTriggerTemplate = "Stop-AzureRmDataFactoryV2Trigger -ResourceGroupName `$rgName -DataFactoryName `$dfName -Name `"{0}`" -Force -Verbose -ErrorAction Stop;"
$StopTriggers = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Triggers) | ForEach-Object { $StopTriggerTemplate -f $_.BaseName }

Write-Output $StopTriggers

Write-Output ""

$RemoveTriggerTemplate = "Remove-AzureRmDataFactoryV2Trigger -ResourceGroupName `$rgName -DataFactoryName `$dfname -Name `"{0}`" -Verbose -Force -ErrorAction Stop;"
$RemoveTriggers = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Triggers) | ForEach-Object { $RemoveTriggerTemplate -f $_.BaseName }

Write-Output $RemoveTriggers

Write-Output ""

$PipelineTemplate = "Remove-AzureRmDataFactoryV2Pipeline -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -Verbose -Force -ErrorAction Stop;"
$Pipelines = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Pipelines) | ForEach-Object { $PipelineTemplate -f $_.BaseName } | Sort-Object -Descending

Write-Output $Pipelines

Write-Output ""

$DatasetTemplate = "Remove-AzureRmDataFactoryV2Dataset -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -Verbose -Force -ErrorAction Stop;"
$Datasets = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Datasets) | ForEach-Object { $DatasetTemplate -f $_.BaseName }

Write-Output $Datasets

Write-Output ""

$LinkedServiceTemplate = "try{{Remove-AzureRmDataFactoryV2LinkedService -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -Verbose -Force -ErrorAction Stop;}}`r`n    catch{{Write-Warning `"Unable to remove __SafranProject_DF_SOURCE_ORA_DB_LINKED_SERVICE__. Most likely it is in use by other pipeline(s)`";}}"
$LinkedServices = Get-ChildItem -Path (Join-Path $SolutionPath \DF\linkedServices) | ForEach-Object { $LinkedServiceTemplate -f $_.BaseName }

Write-Output $LinkedServices
