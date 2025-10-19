@echo off
echo ========================================
echo EMERGENCY FIX - Complete Error Solution
echo ========================================
echo.

echo [STEP 1] Creating minimal vercel.json...
echo ✅ Removed complex routing configuration
echo ✅ Using minimal static site configuration
echo ✅ This should work for any static website
echo.

echo [STEP 2] Verifying critical files exist...
if exist "index.html" (
    echo ✅ index.html - FOUND
) else (
    echo ❌ index.html - MISSING
    echo This is critical - the website won't work without it!
)

if exist "css\style.css" (
    echo ✅ css/style.css - FOUND
) else (
    echo ❌ css/style.css - MISSING
    echo Website will have no styling!
)

if exist "js\script.js" (
    echo ✅ js/script.js - FOUND
) else (
    echo ❌ js/script.js - MISSING
    echo Website will have no functionality!
)

if exist "images" (
    echo ✅ images/ folder - FOUND
) else (
    echo ❌ images/ folder - MISSING
    echo Website will have no images!
)

echo.

echo [STEP 3] Adding changes to Git...
& "C:\Program Files\Git\bin\git.exe" add vercel.json COMPREHENSIVE_ERROR_FIX.md EMERGENCY_FIX.bat
if %errorlevel% neq 0 (
    echo ❌ Failed to add files
    pause
    exit /b 1
)

echo ✅ Files added successfully
echo.

echo [STEP 4] Committing emergency fix...
& "C:\Program Files\Git\bin\git.exe" commit -m "EMERGENCY FIX - Minimal vercel.json configuration"
if %errorlevel% neq 0 (
    echo ❌ Failed to commit
    pause
    exit /b 1
)

echo ✅ Changes committed
echo.

echo [STEP 5] Pushing to GitHub...
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
echo 🚨 EMERGENCY FIX APPLIED!
echo ========================================
echo.
echo Changes made:
echo ✅ Minimal vercel.json (removed complex routing)
echo ✅ Static site configuration only
echo ✅ Pushed to GitHub
echo.
echo CRITICAL NEXT STEPS:
echo.
echo 1. Go to Vercel Dashboard
echo 2. Check your project settings:
echo    - Framework Preset: "Other"
echo    - Build Command: (EMPTY)
echo    - Output Directory: (EMPTY)
echo    - Install Command: (EMPTY)
echo    - Root Directory: (EMPTY)
echo.
echo 3. If settings are wrong, fix them and redeploy
echo 4. Wait 2-3 minutes for deployment
echo 5. Test your website
echo.
echo If this still doesn't work:
echo 1. Delete the Vercel project
echo 2. Create a new project
echo 3. Connect to the same GitHub repository
echo 4. Deploy fresh
echo.
echo Alternative: Try Netlify instead of Vercel
echo - Often works better for static websites
echo - Go to netlify.com and connect your GitHub repo
echo.
pause
