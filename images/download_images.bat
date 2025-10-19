@echo off
echo PestDial Website - Image Download Helper
echo ========================================
echo.
echo This script will help you download images for your website.
echo.
echo Step 1: Visit these websites to download images:
echo - https://unsplash.com/
echo - https://www.pexels.com/
echo - https://pixabay.com/
echo.
echo Step 2: Search for these keywords:
echo - "pest control technician"
echo - "professional exterminator"
echo - "pest control equipment"
echo - "clean home exterior"
echo - "pest treatment"
echo - "termite inspection"
echo - "rodent control"
echo - "bed bug treatment"
echo - "ant control"
echo - "mosquito prevention"
echo - "eco-friendly pest control"
echo - "commercial pest control"
echo.
echo Step 3: Download and save images to the correct folders:
echo - Hero images: images\hero\
echo - Service images: images\services\
echo - Gallery images: images\gallery\
echo - Team images: images\team\
echo - Blog images: images\blog\
echo - Testimonial images: images\testimonials\
echo - Company images: images\company\
echo.
echo Step 4: Rename images according to the IMAGE_REQUIREMENTS.md file
echo.
echo Press any key to open the image requirements file...
pause
start images\IMAGE_REQUIREMENTS.md
echo.
echo Press any key to open the download guide...
pause
start images\DOWNLOAD_GUIDE.md
echo.
echo Press any key to open the placeholder generator...
pause
start images\create_placeholders.html
echo.
echo Image download helper completed!
pause
