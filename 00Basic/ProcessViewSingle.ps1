#Create by  Rocky.houjinSong 2023-12-29
#Function : ProcessViewSingle
#查看非微软当前正在运行的进程
Get-Process | Where-Object { $_.Company -notlike '*Microsoft*' } | Select-Object -Unique Name, Description, Company