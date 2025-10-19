@echo off
echo ========================================
echo Testing Famous Pest Control Website
echo ========================================
echo.

echo Starting local server...
echo Website will open at: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.

python -m http.server 8000
