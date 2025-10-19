@echo off
echo ========================================
echo Clear GitHub and Upload All Files
echo ========================================
echo.

echo [STEP 1] Checking Git installation...
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Git is not installed!
    echo.
    echo Please install Git first:
    echo 1. Go to: https://git-scm.com/download/win
    echo 2. Download and install Git
    echo 3. Restart your computer
    echo 4. Run this script again
    echo.
    pause
    exit /b 1
)

echo ✅ Git is installed
echo.

echo [STEP 2] Initializing fresh Git repository...
if exist .git (
    echo Removing existing Git repository...
    rmdir /s /q .git
)

git init
echo ✅ Fresh Git repository initialized
echo.

echo [STEP 3] Adding remote repository...
git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git
echo ✅ Remote repository added
echo.

echo [STEP 4] Adding ALL files to Git...
git add .
echo ✅ All files added
echo.

echo [STEP 5] Committing all changes...
git commit -m "Complete website upload - All files including CSS, JS, images, and configuration"
echo ✅ Changes committed
echo.

echo [STEP 6] Force pushing to GitHub (this will replace all existing files)...
git push -f origin main
if %errorlevel% neq 0 (
    echo ❌ Failed to push to GitHub
    echo.
    echo Possible solutions:
    echo 1. Check your internet connection
    echo 2. Verify GitHub credentials
    echo 3. Make sure you have write access to the repository
    echo 4. Try again in a few minutes
    echo.
    pause
    exit /b 1
)

echo ✅ Successfully pushed to GitHub
echo.

echo ========================================
echo 🎉 COMPLETE UPLOAD SUCCESSFUL!
echo ========================================
echo.
echo All files have been uploaded to GitHub:
echo ✅ HTML files (all pages)
echo ✅ CSS files (styling)
echo ✅ JavaScript files (functionality)
echo ✅ Images (all website images)
echo ✅ Configuration files (Vercel setup)
echo.
echo Your website should now work correctly on Vercel!
echo.
echo Next steps:
echo 1. Wait 2-3 minutes for Vercel to auto-deploy
echo 2. Visit your website URL
echo 3. Check that all styling and images load
echo.
echo If issues persist:
echo 1. Clear browser cache
echo 2. Try incognito mode
echo 3. Check Vercel deployment logs
echo.
pause
