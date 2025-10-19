# Famous Pest Control Services - Upload Preparation Script
Write-Host "========================================" -ForegroundColor Green
Write-Host "   Famous Pest Control Services" -ForegroundColor Green
Write-Host "   Upload Preparation Script" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""

# Check if Git is installed
Write-Host "Checking for Git installation..." -ForegroundColor Yellow
try {
    $gitVersion = git --version 2>$null
    if ($gitVersion) {
        Write-Host "✓ Git is installed: $gitVersion" -ForegroundColor Green
        Write-Host ""
        
        # Initialize Git repository
        Write-Host "Initializing Git repository..." -ForegroundColor Yellow
        git init
        
        # Add all files
        Write-Host "Adding all files to Git..." -ForegroundColor Yellow
        git add .
        
        # Create commit
        Write-Host "Creating initial commit..." -ForegroundColor Yellow
        git commit -m "Initial commit: Famous Pest Control Services website"
        
        # Add remote
        Write-Host "Adding remote repository..." -ForegroundColor Yellow
        git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git
        
        # Push to GitHub
        Write-Host "Uploading to GitHub..." -ForegroundColor Yellow
        Write-Host "This may take a few minutes..." -ForegroundColor Cyan
        git push -u origin main
        
        if ($LASTEXITCODE -eq 0) {
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Green
            Write-Host "   SUCCESS! Website uploaded to GitHub" -ForegroundColor Green
            Write-Host "========================================" -ForegroundColor Green
            Write-Host ""
            Write-Host "Your website is now available at:" -ForegroundColor Cyan
            Write-Host "https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol" -ForegroundColor White
            Write-Host ""
            Write-Host "To enable GitHub Pages:" -ForegroundColor Yellow
            Write-Host "1. Go to repository Settings" -ForegroundColor White
            Write-Host "2. Scroll to 'Pages' section" -ForegroundColor White
            Write-Host "3. Select 'Deploy from a branch'" -ForegroundColor White
            Write-Host "4. Choose 'main' branch" -ForegroundColor White
            Write-Host "5. Your site will be live at:" -ForegroundColor White
            Write-Host "   https://octaleadsprivatelimited-cloud.github.io/Famous-Pestcontrol/" -ForegroundColor Cyan
        } else {
            Write-Host ""
            Write-Host "========================================" -ForegroundColor Red
            Write-Host "   ERROR: Upload failed" -ForegroundColor Red
            Write-Host "========================================" -ForegroundColor Red
            Write-Host ""
            Write-Host "Please check your internet connection and try again." -ForegroundColor Yellow
            Write-Host "Make sure you have access to the repository." -ForegroundColor Yellow
        }
    }
} catch {
    Write-Host "✗ Git is not installed!" -ForegroundColor Red
    Write-Host ""
    Write-Host "Please install Git first:" -ForegroundColor Yellow
    Write-Host "1. Go to: https://git-scm.com/download/win" -ForegroundColor White
    Write-Host "2. Download and install Git" -ForegroundColor White
    Write-Host "3. Restart your terminal" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    Write-Host ""
    Write-Host "Alternative: Use GitHub Desktop" -ForegroundColor Cyan
    Write-Host "Download from: https://desktop.github.com/" -ForegroundColor White
}

Write-Host ""
Write-Host "Press any key to exit..." -ForegroundColor Gray
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
