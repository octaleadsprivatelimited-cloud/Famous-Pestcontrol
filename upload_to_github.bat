@echo off
title Upload Website to GitHub
color 0A

echo.
echo ========================================
echo   Famous Pest Control Services
echo   GitHub Upload Assistant
echo ========================================
echo.

echo Checking if Git is installed...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo ERROR: Git is not installed!
    echo.
    echo Please install Git from: https://git-scm.com/download/win
    echo Then run this script again.
    echo.
    pause
    exit /b 1
)

echo Git is installed! ✓
echo.

echo Initializing Git repository...
git init

echo.
echo Adding all files to Git...
git add .

echo.
echo Creating initial commit...
git commit -m "Initial commit: Famous Pest Control Services website"

echo.
echo Adding remote repository...
git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git

echo.
echo Uploading to GitHub...
echo This may take a few minutes depending on your internet connection...
git push -u origin main

if %errorlevel% equ 0 (
    echo.
    echo ========================================
    echo   SUCCESS! Website uploaded to GitHub
    echo ========================================
    echo.
    echo Your website is now available at:
    echo https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol
    echo.
    echo To enable GitHub Pages:
    echo 1. Go to repository Settings
    echo 2. Scroll to "Pages" section
    echo 3. Select "Deploy from a branch"
    echo 4. Choose "main" branch
    echo.
) else (
    echo.
    echo ========================================
    echo   ERROR: Upload failed
    echo ========================================
    echo.
    echo Please check your internet connection and try again.
    echo Make sure you have access to the repository.
    echo.
)

echo.
echo Press any key to exit...
pause >nul
