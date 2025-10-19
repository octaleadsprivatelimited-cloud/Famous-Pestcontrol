@echo off
title Upload Website to GitHub
color 0A

echo.
echo ========================================
echo   Famous Pest Control Services
echo   GitHub Upload Script
echo ========================================
echo.

echo Checking Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo Git not found! Please restart your terminal after installing Git.
    echo.
    echo If you installed Git, please:
    echo 1. Close this window
    echo 2. Open a new Command Prompt
    echo 3. Run this script again
    echo.
    pause
    exit /b 1
)

echo Git found! Starting upload process...
echo.

echo Step 1: Initializing Git repository...
git init

echo.
echo Step 2: Adding all files to Git...
git add .

echo.
echo Step 3: Creating initial commit...
git commit -m "Initial commit: Famous Pest Control Services website"

echo.
echo Step 4: Adding remote repository...
git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git

echo.
echo Step 5: Uploading to GitHub...
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
    echo Next steps:
    echo 1. Go to the repository on GitHub
    echo 2. Click Settings ^> Pages
    echo 3. Select "Deploy from a branch"
    echo 4. Choose "main" branch
    echo 5. Your site will be live at:
    echo    https://octaleadsprivatelimited-cloud.github.io/Famous-Pestcontrol/
    echo.
) else (
    echo.
    echo ========================================
    echo   ERROR: Upload failed
    echo ========================================
    echo.
    echo Please check:
    echo - Your internet connection
    echo - Repository access permissions
    echo - Try again in a few minutes
    echo.
)

echo.
echo Press any key to exit...
pause >nul
