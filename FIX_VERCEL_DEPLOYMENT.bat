@echo off
echo ========================================
echo CRITICAL: Fix Vercel Deployment Issues
echo ========================================
echo.

echo [STEP 1] Checking if Git is installed...
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

echo [STEP 2] Adding all files to Git...
git add .
if %errorlevel% neq 0 (
    echo ❌ Failed to add files
    pause
    exit /b 1
)

echo ✅ Files added successfully
echo.

echo [STEP 3] Committing changes...
git commit -m "Complete website upload - Added CSS, JS, images, and configuration files"
if %errorlevel% neq 0 (
    echo ❌ Failed to commit
    pause
    exit /b 1
)

echo ✅ Changes committed
echo.

echo [STEP 4] Pushing to GitHub...
git push origin main
if %errorlevel% neq 0 (
    echo ❌ Failed to push to GitHub
    echo.
    echo Possible solutions:
    echo 1. Check your internet connection
    echo 2. Verify GitHub credentials
    echo 3. Try again in a few minutes
    echo.
    pause
    exit /b 1
)

echo ✅ Successfully pushed to GitHub
echo.

echo ========================================
echo 🎉 DEPLOYMENT COMPLETE!
echo ========================================
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
