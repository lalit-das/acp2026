@echo off
gcc max_array.c -o max_array.exe

if %errorlevel% neq 0 (
    echo Compilation Error!
    pause
    exit
)

echo Compilation Successful!
echo Running program...
echo.

max_array.exe
pause