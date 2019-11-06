$SolutionPath = "C:\Users\kebec\Documents\GitHub\DataLakers\projects\SafranProject\5.0"

$LinkedServiceTemplate = "if ((Get-AzureRmDataFactoryV2LinkedService -ResourceGroupName `$rgname -DataFactoryName `$dfname | Where-Object {{`$_.Name -eq '{0}'}}).Count -eq 0){{`r`n    Set-AzureRmDataFactoryV2LinkedService -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -DefinitionFile `"`$workDir\LinkedServices\{0}.json`" -Verbose -ErrorAction Stop;`r`n}}"
$LinkedServices = Get-ChildItem -Path (Join-Path $SolutionPath \DF\linkedServices) | ForEach-Object { $LinkedServiceTemplate -f $_.BaseName }

Write-Output $LinkedServices

Write-Output ""

$DatasetTemplate = "Set-AzureRmDataFactoryV2Dataset -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -DefinitionFile `"`$workDir\Datasets\{0}.json`" -Verbose -ErrorAction Stop;"
$Datasets = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Datasets) | ForEach-Object { $DatasetTemplate -f $_.BaseName }

Write-Output $Datasets

Write-Output ""

$PipelineTemplate = "Set-AzureRmDataFactoryV2Pipeline -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -DefinitionFile `"`$workDir\Pipelines\{0}.json`" -Verbose -ErrorAction Stop;"
$Pipelines = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Pipelines) | ForEach-Object { $PipelineTemplate -f $_.BaseName } | Sort-Object -Descending

Write-Output $Pipelines

Write-Output ""

$TriggerTemplate = "Set-AzureRmDataFactoryV2Trigger -ResourceGroupName `$rgname -DataFactoryName `$dfname -Name `"{0}`" -DefinitionFile `"`$workDir\Triggers\{0}.json`" -Verbose -ErrorAction Stop;"
$Triggers = Get-ChildItem -Path (Join-Path $SolutionPath \DF\Triggers) | ForEach-Object { $TriggerTemplate -f $_.BaseName }

Write-Output $Triggers
