Write-Host "Famous Pest Control Services - Upload Script" -ForegroundColor Green
Write-Host "=============================================" -ForegroundColor Green
Write-Host ""

# Check if Git is available
Write-Host "Checking for Git..." -ForegroundColor Yellow
$gitCheck = Get-Command git -ErrorAction SilentlyContinue

if ($gitCheck) {
    Write-Host "Git found! Starting upload process..." -ForegroundColor Green
    Write-Host ""
    
    # Initialize repository
    Write-Host "Initializing Git repository..." -ForegroundColor Cyan
    git init
    
    # Add files
    Write-Host "Adding files to Git..." -ForegroundColor Cyan
    git add .
    
    # Commit
    Write-Host "Creating commit..." -ForegroundColor Cyan
    git commit -m "Initial commit: Famous Pest Control Services website"
    
    # Add remote
    Write-Host "Adding remote repository..." -ForegroundColor Cyan
    git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git
    
    # Push
    Write-Host "Uploading to GitHub..." -ForegroundColor Cyan
    git push -u origin main
    
    Write-Host ""
    Write-Host "Upload completed!" -ForegroundColor Green
    Write-Host "Repository: https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol" -ForegroundColor White
    
} else {
    Write-Host "Git not found!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Download from: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Install with default settings" -ForegroundColor White
    Write-Host "3. Restart terminal and run this script again" -ForegroundColor White
}

Write-Host ""
Write-Host "Press Enter to continue..." -ForegroundColor Gray
Read-Host
