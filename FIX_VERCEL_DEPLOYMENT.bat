@echo off
echo ========================================
echo Fix Vercel Deployment Failure
echo ========================================
echo.

echo [STEP 1] Updating configuration files...
echo ✅ Updated vercel.json
echo ✅ Updated package.json
echo.

echo [STEP 2] Adding changes to Git...
& "C:\Program Files\Git\bin\git.exe" add vercel.json package.json
if %errorlevel% neq 0 (
    echo ❌ Failed to add files
    pause
    exit /b 1
)

echo ✅ Files added successfully
echo.

echo [STEP 3] Committing changes...
& "C:\Program Files\Git\bin\git.exe" commit -m "Fix Vercel deployment configuration - Updated vercel.json and package.json"
if %errorlevel% neq 0 (
    echo ❌ Failed to commit
    pause
    exit /b 1
)

echo ✅ Changes committed
echo.

echo [STEP 4] Pushing to GitHub...
& "C:\Program Files\Git\bin\git.exe" push origin main
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
echo 🎉 DEPLOYMENT FIX APPLIED!
echo ========================================
echo.
echo Changes made:
echo ✅ Updated vercel.json with proper static site configuration
echo ✅ Updated package.json with empty build commands
echo ✅ Pushed changes to GitHub
echo.
echo Next steps:
echo 1. Vercel will auto-detect the changes
echo 2. Wait 2-3 minutes for redeployment
echo 3. Check your website URL
echo.
echo If deployment still fails:
echo 1. Check Vercel build logs for specific errors
echo 2. Verify project settings in Vercel dashboard
echo 3. Ensure all files are properly uploaded
echo.
pause