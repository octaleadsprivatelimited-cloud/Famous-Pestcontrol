@echo off
title Rename Folder to Famous Pest Control Services
color 0A

echo.
echo ========================================
echo   Rename Folder Script
echo ========================================
echo.

echo This script will rename your folder from "pestdial-website" to "Famous Pest Control Services"
echo.

echo IMPORTANT: Before running this script:
echo 1. Close all file explorers and terminals
echo 2. Make sure no programs are using the folder
echo 3. Save any open files
echo.

echo Press any key to continue...
pause >nul

echo.
echo Attempting to rename folder...
echo.

cd ..
if exist "pestdial-website" (
    echo Found folder: pestdial-website
    echo Renaming to: Famous Pest Control Services
    ren "pestdial-website" "Famous Pest Control Services"
    
    if exist "Famous Pest Control Services" (
        echo.
        echo ========================================
        echo   SUCCESS! Folder renamed successfully
        echo ========================================
        echo.
        echo Your website folder is now named:
        echo "Famous Pest Control Services"
        echo.
        echo New path: C:\Users\navya\Famous Pest Control Services
        echo.
    ) else (
        echo.
        echo ========================================
        echo   ERROR: Folder rename failed
        echo ========================================
        echo.
        echo The folder might be in use by another program.
        echo Please:
        echo 1. Close all file explorers
        echo 2. Close all terminals/command prompts
        echo 3. Try again
        echo.
    )
) else (
    echo.
    echo ========================================
    echo   ERROR: Folder not found
    echo ========================================
    echo.
    echo The folder "pestdial-website" was not found.
    echo Please check the current directory.
    echo.
)

echo.
echo Press any key to exit...
pause >nul
