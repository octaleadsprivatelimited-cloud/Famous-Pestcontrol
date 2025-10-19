@echo off
echo ========================================
echo Install Git and Upload Website
echo ========================================
echo.

echo [STEP 1] Installing Git...
echo.
echo Please follow these steps:
echo.
echo 1. Go to: https://git-scm.com/download/win
echo 2. Click "Download for Windows"
echo 3. Run the installer
echo 4. Use default settings (click Next through all steps)
echo 5. Restart your computer after installation
echo.
echo After installing Git, run this script again.
echo.
pause

echo [STEP 2] Testing Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is still not installed
    echo Please install Git first and restart your computer
    pause
    exit /b 1
)

echo ✅ Git is now installed!
echo.

echo [STEP 3] Initializing Git repository...
git init
git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git

echo [STEP 4] Adding all files...
git add .

echo [STEP 5] Committing changes...
git commit -m "Complete website upload with all assets"

echo [STEP 6] Pushing to GitHub...
git push -u origin main

echo.
echo ========================================
echo 🎉 UPLOAD COMPLETE!
echo ========================================
echo.
echo Your website should now work on Vercel!
echo.
pause
