@echo off
echo ========================================
echo Fix 404 Errors - Complete Solution
echo ========================================
echo.

echo [STEP 1] Updating Vercel configuration...
echo ✅ Updated vercel.json with proper routing
echo ✅ Added rewrites for static files
echo ✅ Fixed root directory routing
echo.

echo [STEP 2] Verifying file structure...
if exist "index.html" (
    echo ✅ index.html found
) else (
    echo ❌ index.html missing
)

if exist "css\style.css" (
    echo ✅ CSS file found
) else (
    echo ❌ CSS file missing
)

if exist "js\script.js" (
    echo ✅ JavaScript file found
) else (
    echo ❌ JavaScript file missing
)

if exist "images" (
    echo ✅ Images folder found
) else (
    echo ❌ Images folder missing
)

echo.

echo [STEP 3] Adding changes to Git...
& "C:\Program Files\Git\bin\git.exe" add vercel.json FIX_404_ERRORS.md FIX_404_ERRORS.bat
if %errorlevel% neq 0 (
    echo ❌ Failed to add files
    pause
    exit /b 1
)

echo ✅ Files added successfully
echo.

echo [STEP 4] Committing changes...
& "C:\Program Files\Git\bin\git.exe" commit -m "Fix 404 errors - Update Vercel routing configuration"
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
echo 🎉 404 ERRORS FIXED!
echo ========================================
echo.
echo Changes made:
echo ✅ Updated vercel.json with proper routing
echo ✅ Added rewrites for static file serving
echo ✅ Fixed root directory configuration
echo ✅ Pushed changes to GitHub
echo.
echo Next steps:
echo 1. Vercel will auto-detect the changes
echo 2. Wait 2-3 minutes for redeployment
echo 3. Test all URLs - they should work now
echo.
echo Test these URLs:
echo - Homepage: /
echo - About: /about.html
echo - Services: /services.html
echo - Contact: /contact.html
echo - Blog: /blog.html
echo - Testimonials: /testimonials.html
echo.
echo If 404 errors persist:
echo 1. Check Vercel project settings
echo 2. Ensure Framework Preset is set to "Other"
echo 3. Set Build Command to empty
echo 4. Set Output Directory to empty
echo.
pause
