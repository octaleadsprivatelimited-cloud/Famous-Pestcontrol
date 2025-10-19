@echo off
echo.
echo ========================================
echo   Pushing Mobile Fixes to GitHub
echo ========================================
echo.

echo 📱 Adding all mobile fix files to Git...
git add .

echo.
echo 💾 Committing mobile scrolling and menu fixes...
git commit -m "Fix mobile scrolling issues and menu functionality

- Fixed horizontal scrolling on mobile devices
- Fixed vertical over-scrolling issues  
- Fixed mobile menu not opening
- Added proper viewport settings
- Enhanced mobile menu animations
- Added body scroll lock when menu is open
- Added click outside to close functionality
- Added window resize handling
- Created mobile-fixed HTML file
- Added comprehensive mobile CSS fixes
- Enhanced JavaScript for mobile menu"

echo.
echo 🚀 Pushing to GitHub...
git push origin main

echo.
echo ✅ Mobile fixes pushed to GitHub successfully!
echo.
echo 📋 Summary of fixes:
echo    • Fixed horizontal scrolling issues
echo    • Fixed vertical over-scrolling problems
echo    • Fixed mobile menu not opening
echo    • Added proper mobile responsiveness
echo    • Enhanced mobile menu animations
echo    • Added comprehensive mobile CSS
echo    • Created mobile-fixed HTML file
echo.
echo 🌐 Your website should now work perfectly on mobile devices!
echo.
pause
