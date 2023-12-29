#Created By Rocky.houjinSong  2023-12-29
#Function :LaunchTrello
#正确打开 所在路径 
# 获取 Trello 的安装路径
$installLocation = (Get-AppxPackage -Name *trello*).InstallLocation
#启动 
Start-Process -FilePath (Get-ChildItem -Path $installLocation -Recurse -Filter "*trello*.exe" | Where-Object { $_.Extension -eq '.exe' } | Select-Object -First 1 -ExpandProperty FullName)