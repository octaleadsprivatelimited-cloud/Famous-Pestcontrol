@echo off
echo ========================================
echo Start Local Server - Famous Pest Control
echo ========================================
echo.

echo [STEP 1] Checking Python installation...
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo ❌ Python is not installed!
    echo.
    echo Please install Python first:
    echo 1. Go to: https://www.python.org/downloads/
    echo 2. Download and install Python
    echo 3. Make sure to check "Add Python to PATH"
    echo 4. Restart your computer
    echo 5. Run this script again
    echo.
    pause
    exit /b 1
)

echo ✅ Python is installed
echo.

echo [STEP 2] Starting local server...
echo 🚀 Starting Famous Pest Control Services Website
echo 🌐 Server will run on: http://localhost:3000
echo 📱 Mobile-friendly with working mobile menu
echo.
echo Mobile Menu Testing:
echo 1. Open the website in your browser
echo 2. Resize browser to mobile size (768px or less)
echo 3. Click the hamburger menu button
echo 4. Menu should open with smooth animation
echo 5. Click outside or on links to close
echo.
echo Press Ctrl+C to stop the server
echo.

python start_local_server.py

echo.
echo ========================================
echo 🛑 Server stopped
echo ========================================
echo.
pause
