#Created By Rocky.houjinSong  2023-12-29
#Function :定位 Trello所在 路径, 弹出文件资源管理器 
# Trello是从微软商店中下载; 
# 但 防止用户 自定义/修改 微软商店下载安装位置 ,以变量的方式进行存储 

#正确打开 所在路径 
# 获取 Trello 的安装路径
#此处获取的 并非真正的所在路径,而是父级路径
$installLocation = (Get-AppxPackage -Name *trello*).InstallLocation

if ($installLocation) {
    # 进入 Trello 安装路径
    Set-Location -Path $installLocation -ErrorAction SilentlyContinue

    # 匹配所有文件（包括子文件夹）
    $files = Get-ChildItem -Recurse | Where-Object { $_.Extension -eq '.exe' }

    if ($files.Count -gt 0) {
        # 获取 Trello 所在文件夹路径
        $trelloFolder = $files[0].DirectoryName

        # 使用 shell 命令打开文件资源管理器并应用文件类型筛选
        [System.Diagnostics.Process]::Start("explorer.exe", "/select, `"$($files[0].FullName)`"")
    } else {
        Write-Host "在 Trello 文件夹内未找到符合条件的可执行程序。"
    }
} else {
    Write-Host "未找到 Trello 的安装路径。"
}