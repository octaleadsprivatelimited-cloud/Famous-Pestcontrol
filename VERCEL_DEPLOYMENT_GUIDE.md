# Vercel Deployment Guide - Famous Pest Control Services Website

## 🚀 Quick Fix for Vercel Deployment Issues

### Common Issues and Solutions

#### 1. **File Path Issues**
- **Problem**: CSS/JS not loading, images not displaying
- **Solution**: Ensure all paths are relative (not absolute)
- **Check**: All `href` and `src` attributes should start with `./` or be relative paths

#### 2. **Build Configuration**
- **Problem**: Vercel not recognizing static website
- **Solution**: Use the provided `vercel.json` and `package.json` files
- **Files Added**:
  - `vercel.json` - Vercel configuration
  - `package.json` - Project metadata
  - `.gitignore` - Git ignore rules

#### 3. **Cache Issues**
- **Problem**: Old version showing after deployment
- **Solution**: Clear browser cache or use incognito mode
- **Vercel**: Redeploy to clear Vercel cache

### Step-by-Step Deployment

#### Option 1: GitHub Integration (Recommended)
1. **Push to GitHub**:
   ```bash
   git add .
   git commit -m "Fix Vercel deployment issues"
   git push origin main
   ```

2. **Connect to Vercel**:
   - Go to [vercel.com](https://vercel.com)
   - Click "New Project"
   - Import from GitHub repository
   - Select your repository
   - Deploy

#### Option 2: Direct Upload
1. **Install Vercel CLI**:
   ```bash
   npm i -g vercel
   ```

2. **Deploy**:
   ```bash
   cd C:\Users\navya\pestdial-website
   vercel
   ```

### Configuration Files Added

#### `vercel.json`
```json
{
  "version": 2,
  "builds": [
    {
      "src": "**/*",
      "use": "@vercel/static"
    }
  ],
  "routes": [
    {
      "src": "/(.*)",
      "dest": "/$1"
    }
  ]
}
```

#### `package.json`
```json
{
  "name": "famous-pest-control-website",
  "version": "1.0.0",
  "description": "Famous Pest Control Services Website",
  "main": "index.html"
}
```

### Post-Deployment Checklist

- [ ] Website loads without errors
- [ ] All images display correctly
- [ ] CSS styling is applied
- [ ] Navigation works on all pages
- [ ] Mobile responsive design works
- [ ] Contact forms are functional
- [ ] All internal links work

### Troubleshooting

#### If CSS is not loading:
1. Check browser developer tools (F12)
2. Look for 404 errors in Network tab
3. Verify file paths in HTML
4. Ensure files are uploaded to GitHub

#### If images are not displaying:
1. Check image file names (case-sensitive)
2. Verify image paths in HTML
3. Ensure images are in correct directories

#### If navigation is broken:
1. Check all HTML files have consistent navigation
2. Verify all page files exist
3. Test all internal links

### Vercel Settings

#### Build Settings:
- **Framework Preset**: Other
- **Build Command**: (leave empty)
- **Output Directory**: (leave empty)
- **Install Command**: (leave empty)

#### Environment Variables:
- No environment variables needed for static site

### Performance Optimization

#### Images:
- All images are optimized WebP format
- Proper alt tags for accessibility
- Responsive image sizing

#### CSS:
- Minified and optimized
- Modern CSS Grid and Flexbox
- Mobile-first responsive design

#### JavaScript:
- Vanilla JavaScript (no dependencies)
- Optimized for performance
- Mobile menu functionality

### Support

If issues persist:
1. Check Vercel deployment logs
2. Verify all files are uploaded correctly
3. Test locally first
4. Contact Vercel support if needed

---

**Files Fixed/Added**:
- ✅ `vercel.json` - Vercel configuration
- ✅ `package.json` - Project metadata  
- ✅ `.gitignore` - Git ignore rules
- ✅ Fixed logo link in `services.html`
- ✅ Verified all file paths are correct

**Ready for Deployment**: ✅ Yes
