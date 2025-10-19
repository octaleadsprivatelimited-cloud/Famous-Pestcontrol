@echo off
title Upload Website - No Git Required
color 0A

echo.
echo ========================================
echo   Famous Pest Control Services
echo   Upload Without Git
echo ========================================
echo.

echo Since Git is not working, here are your options:
echo.
echo OPTION 1: GitHub Desktop (RECOMMENDED)
echo ========================================
echo 1. Download GitHub Desktop: https://desktop.github.com/
echo 2. Install and sign in with your GitHub account
echo 3. Clone repository: https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git
echo 4. Copy all website files to the cloned folder
echo 5. Commit and push changes
echo.

echo OPTION 2: Web Upload (EASIEST)
echo ================================
echo 1. Go to: https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol
echo 2. Click "uploading an existing file"
echo 3. Drag and drop all your website files
echo 4. Commit changes
echo.

echo OPTION 3: Fix Git and Try Again
echo ================================
echo 1. Restart your computer completely
echo 2. Open new Command Prompt
echo 3. Try: git --version
echo 4. If it works, run: upload_website.bat
echo.

echo FILES TO UPLOAD:
echo =================
echo - 22 HTML pages (main + service + blog pages)
echo - css/style.css
echo - js/script.js
echo - images/ folder (all images)
echo - sitemap.xml
echo - robots.txt
echo - README.md
echo.

echo AFTER UPLOAD:
echo ==============
echo 1. Go to repository Settings
echo 2. Click Pages
echo 3. Select "Deploy from a branch"
echo 4. Choose "main" branch
echo 5. Your site will be live at:
echo    https://octaleadsprivatelimited-cloud.github.io/Famous-Pestcontrol/
echo.

echo Press any key to open GitHub repository...
pause >nul

echo Opening GitHub repository...
start https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol

echo.
echo Repository opened in your browser!
echo Follow the instructions above to upload your files.
echo.
pause
