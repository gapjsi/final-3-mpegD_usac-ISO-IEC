# 确保脚本在解决方案文件(.sln)所在目录运行
$solutionDir = $PWD.Path
$solutionFile = Get-ChildItem -Path $solutionDir -Filter *.sln -File | Select-Object -First 1

if (-not $solutionFile) {
    Write-Error "未在当前目录找到解决方案文件(.sln)"
    exit 1
}

Write-Host "开始处理解决方案: $($solutionFile.Name)"
Write-Host "解决方案目录: $solutionDir`n"

# 1. 递归查找所有.c文件并批量重命名为.cpp
$cFiles = Get-ChildItem -Path $solutionDir -Filter *.c -Recurse -File
$renamedCount = 0

if ($cFiles.Count -gt 0) {
    Write-Host "发现 $($cFiles.Count) 个.c文件，开始重命名..."
    foreach ($file in $cFiles) {
        $newPath = $file.FullName -replace '\.c$', '.cpp'
        # 避免覆盖已存在的.cpp文件
        if (-not (Test-Path $newPath)) {
            Rename-Item -Path $file.FullName -Destination $newPath -Force
            Write-Host "  重命名: $($file.FullName) -> $newPath"
            $renamedCount++
        }
        else {
            Write-Warning "  跳过: $newPath 已存在，未重命名"
        }
    }
    Write-Host "`n重命名完成，共处理 $renamedCount 个文件`n"
}
else {
    Write-Host "未发现.c文件，无需重命名`n"
}

# 2. 更新所有项目文件(.vcxproj)中的引用（替换.c为.cpp）
$vcxprojFiles = Get-ChildItem -Path $solutionDir -Filter *.vcxproj -Recurse -File

if ($vcxprojFiles.Count -gt 0) {
    Write-Host "发现 $($vcxprojFiles.Count) 个项目文件，开始更新引用..."
    foreach ($projFile in $vcxprojFiles) {
        $content = Get-Content -Path $projFile.FullName -Raw
        $newContent = $content -replace '\.c</', '.cpp</' -replace '\.c"', '.cpp"'
        
        if ($newContent -ne $content) {
            Set-Content -Path $projFile.FullName -Value $newContent -Force
            Write-Host "  更新项目: $($projFile.FullName)"
        }
        else {
            Write-Host "  项目无需更新: $($projFile.FullName)"
        }
    }
    Write-Host "`n项目文件更新完成"
}
else {
    Write-Host "未发现项目文件(.vcxproj)"
}

Write-Host "`n所有操作完成！"
    