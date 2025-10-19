@echo off
title Famous Pest Control Services - Local Server
color 0A

echo.
echo ========================================
echo   Famous Pest Control Services
echo   Local Development Server
echo ========================================
echo.

cd /d "%~dp0"

echo Starting local server...
echo.
echo Website will be available at:
echo   http://localhost:8000
echo   http://127.0.0.1:8000
echo.

REM Try to open browser
start http://localhost:8000

REM Start Python server if available
python -m http.server 8000 2>nul
if %errorlevel% neq 0 (
    echo Python not found. Trying alternative method...
    echo.
    echo You can also open the website by:
    echo 1. Opening index.html directly in your browser
    echo 2. Using any local server software
    echo.
    pause
)

echo.
echo Server stopped.
pause
