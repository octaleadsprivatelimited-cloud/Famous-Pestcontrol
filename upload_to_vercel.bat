@echo off
echo ========================================
echo Famous Pest Control Services Website
echo Vercel Deployment Script
echo ========================================
echo.

echo [1/4] Checking Git status...
git status
echo.

echo [2/4] Adding all files to Git...
git add .
echo.

echo [3/4] Committing changes...
git commit -m "Fix Vercel deployment issues - Added configuration files and fixed HTML structure"
echo.

echo [4/4] Pushing to GitHub...
git push origin main
echo.

echo ========================================
echo Deployment Complete!
echo ========================================
echo.
echo Next Steps:
echo 1. Go to https://vercel.com
echo 2. Import your GitHub repository
echo 3. Deploy the project
echo 4. Your website will be live!
echo.
echo If you need help, check VERCEL_DEPLOYMENT_GUIDE.md
echo.
pause
