#Created by Rocky.houjinSong  2023-12-29
#Funcion :清除PS 历史命令 
# Clear-history  无效,此为误区


Remove-Item (Get-PSReadLineOption).HistorySavePath  #执行一次即可; 重复报错
#执行后重新打开