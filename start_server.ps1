# Famous Pest Control Services - Local Server
Write-Host "🚀 Starting Famous Pest Control Services website..." -ForegroundColor Green
Write-Host ""

# Change to the website directory
Set-Location "C:\Users\navya\pestdial-website"

# Create a simple HTTP server using .NET
Add-Type -AssemblyName System.Web

$listener = New-Object System.Net.HttpListener
$listener.Prefixes.Add("http://localhost:8000/")

try {
    $listener.Start()
    Write-Host "✅ Server started successfully!" -ForegroundColor Green
    Write-Host "📱 Local URL: http://localhost:8000" -ForegroundColor Cyan
    Write-Host "🌐 Network URL: http://127.0.0.1:8000" -ForegroundColor Cyan
    Write-Host "📁 Serving from: $(Get-Location)" -ForegroundColor Yellow
    Write-Host "⏹️  Press Ctrl+C to stop the server" -ForegroundColor Red
    Write-Host "-" * 50
    
    # Try to open browser
    try {
        Start-Process "http://localhost:8000"
        Write-Host "🌐 Browser opened automatically" -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Could not open browser automatically" -ForegroundColor Yellow
        Write-Host "🔗 Please open http://localhost:8000 in your browser" -ForegroundColor Cyan
    }
    
    # Server loop
    while ($listener.IsListening) {
        $context = $listener.GetContext()
        $request = $context.Request
        $response = $context.Response
        
        $localPath = $request.Url.LocalPath
        if ($localPath -eq "/") { 
            $localPath = "/index.html" 
        }
        
        $filePath = Join-Path (Get-Location) $localPath.TrimStart('/')
        
        if (Test-Path $filePath) {
            $content = [System.IO.File]::ReadAllBytes($filePath)
            $response.ContentLength64 = $content.Length
            $response.OutputStream.Write($content, 0, $content.Length)
        } else {
            $response.StatusCode = 404
        }
        
        $response.Close()
    }
} catch {
    Write-Host "❌ Error starting server: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "💡 Make sure port 8000 is not already in use" -ForegroundColor Yellow
} finally {
    if ($listener.IsListening) {
        $listener.Stop()
    }
    Write-Host "🛑 Server stopped" -ForegroundColor Red
}
