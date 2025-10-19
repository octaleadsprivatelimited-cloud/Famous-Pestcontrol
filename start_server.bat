@echo off
echo Starting Famous Pest Control Services website...
echo.
echo Server will be available at: http://localhost:8000
echo.
echo Press Ctrl+C to stop the server
echo.

cd /d "C:\Users\navya\pestdial-website"

REM Try Python first
python -m http.server 8000 2>nul
if %errorlevel% neq 0 (
    echo Python not found, trying alternative method...
    REM Try Node.js serve
    npx serve . -p 8000 2>nul
    if %errorlevel% neq 0 (
        echo Node.js not found, trying PowerShell method...
        powershell -Command "$listener = New-Object System.Net.HttpListener; $listener.Prefixes.Add('http://localhost:8000/'); $listener.Start(); Write-Host 'Server running at http://localhost:8000/'; Write-Host 'Press Ctrl+C to stop'; while ($listener.IsListening) { $context = $listener.GetContext(); $request = $context.Request; $response = $context.Response; $localPath = $request.Url.LocalPath; if ($localPath -eq '/') { $localPath = '/index.html' }; $filePath = Join-Path (Get-Location) $localPath.TrimStart('/'); if (Test-Path $filePath) { $content = [System.IO.File]::ReadAllBytes($filePath); $response.ContentLength64 = $content.Length; $response.OutputStream.Write($content, 0, $content.Length) } else { $response.StatusCode = 404 }; $response.Close() }"
    )
)

pause
