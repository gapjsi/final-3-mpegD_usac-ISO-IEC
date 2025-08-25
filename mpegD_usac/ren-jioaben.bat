@echo off
setlocal enabledelayedexpansion

echo 开始处理当前文件夹及所有子文件夹中的.c文件...
echo.

rem 处理当前文件夹中的.c文件
if exist *.c (
    echo 正在处理当前目录：%cd%
    ren *.c *.cpp
    echo  已处理当前目录的.c文件
    echo.
) else (
    echo 当前目录没有.c文件
    echo.
)

rem 递归处理所有子文件夹中的.c文件
for /d /r %%d in (*) do (
    pushd "%%d"
    if exist *.c (
        echo 正在处理子目录：%%d
        ren *.c *.cpp
        echo  已处理该目录的.c文件
        echo.
    )
    popd
)

echo 所有操作完成！
endlocal
