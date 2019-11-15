 Get-ChildItem -Recurse | Where-Object { $_.PSIsContainer -eq $False } | ForEach-Object { $_.FullName } | ForEach-Object { $_.replace("C:\Users\kebec\Desktop\", "/mnt/eq17211/").replace("\", "/") }
