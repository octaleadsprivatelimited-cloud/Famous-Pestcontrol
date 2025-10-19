# Deployment Guide - Famous Pest Control Services Website

## 🚀 Uploading to GitHub Repository

### Prerequisites
1. **Git** must be installed on your system
2. **GitHub account** with access to the repository
3. **Repository URL**: https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git

### Step 1: Install Git (if not already installed)

#### Windows:
1. Download Git from: https://git-scm.com/download/win
2. Run the installer with default settings
3. Restart your command prompt/terminal

#### Verify Installation:
```bash
git --version
```

### Step 2: Configure Git (First time only)
```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

### Step 3: Initialize and Upload to Repository

#### Option A: Using Command Line
```bash
# Navigate to your project directory
cd C:\Users\navya\pestdial-website

# Initialize Git repository
git init

# Add all files to staging
git add .

# Create initial commit
git commit -m "Initial commit: Famous Pest Control Services website"

# Add remote repository
git remote add origin https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git

# Push to repository
git push -u origin main
```

#### Option B: Using GitHub Desktop
1. Download GitHub Desktop: https://desktop.github.com/
2. Sign in with your GitHub account
3. Clone the repository: https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol.git
4. Copy all website files to the cloned folder
5. Commit and push changes

#### Option C: Using VS Code
1. Open VS Code in your project folder
2. Install "Git" extension
3. Use the Source Control panel to commit and push

### Step 4: Verify Upload
1. Visit: https://github.com/octaleadsprivatelimited-cloud/Famous-Pestcontrol
2. Check that all files are uploaded
3. Verify the README.md displays correctly

## 🌐 Hosting Options

### Option 1: GitHub Pages (Free)
1. Go to repository Settings
2. Scroll to "Pages" section
3. Select "Deploy from a branch"
4. Choose "main" branch
5. Your site will be available at: `https://octaleadsprivatelimited-cloud.github.io/Famous-Pestcontrol/`

### Option 2: Netlify (Recommended)
1. Connect your GitHub repository to Netlify
2. Automatic deployments on every push
3. Custom domain support
4. SSL certificate included

### Option 3: Vercel
1. Import your GitHub repository
2. Automatic deployments
3. Global CDN
4. Custom domain support

## 📁 Files Included in Upload

### Core Website Files
- ✅ `index.html` - Homepage
- ✅ `about.html` - About page
- ✅ `services.html` - Services page
- ✅ `contact.html` - Contact page
- ✅ `blog.html` - Blog page
- ✅ `testimonials.html` - Testimonials page
- ✅ `privacy-policy.html` - Privacy policy
- ✅ `terms-conditions.html` - Terms & conditions

### Service Pages (8 pages)
- ✅ `cockroach-control.html`
- ✅ `termite-control.html`
- ✅ `rodent-control.html`
- ✅ `bedbug-control.html`
- ✅ `ant-control.html`
- ✅ `mosquito-control.html`
- ✅ `spider-control.html`
- ✅ `flies-control.html`

### Blog Pages (5 pages)
- ✅ `cockroach-prevention-guide.html`
- ✅ `termite-signs-guide.html`
- ✅ `mosquito-control-guide.html`
- ✅ `bedbug-identification-guide.html`
- ✅ `rodent-control-guide.html`

### Assets
- ✅ `css/style.css` - Main stylesheet
- ✅ `js/script.js` - JavaScript functionality
- ✅ `images/` - All images and icons
- ✅ `sitemap.xml` - SEO sitemap
- ✅ `robots.txt` - SEO robots file

### Documentation
- ✅ `README.md` - Project documentation
- ✅ `DEPLOYMENT_GUIDE.md` - This guide
- ✅ `.gitignore` - Git ignore file

## 🔧 Post-Upload Checklist

- [ ] All files uploaded successfully
- [ ] Website loads without errors
- [ ] All images display correctly
- [ ] Navigation works on all pages
- [ ] Contact forms are functional
- [ ] Mobile responsive design works
- [ ] SEO meta tags are present
- [ ] Sitemap.xml is accessible

## 🆘 Troubleshooting

### Common Issues:

1. **Git not found**: Install Git from https://git-scm.com/
2. **Authentication failed**: Use GitHub Personal Access Token
3. **Files not uploading**: Check file permissions
4. **Website not loading**: Verify all file paths are correct

### Getting Help:
- GitHub Documentation: https://docs.github.com/
- Git Documentation: https://git-scm.com/doc
- Contact: famouspestcontrolservices77@gmail.com

---

**Total Files**: 22 HTML pages + assets  
**Total Size**: ~50MB (optimized)  
**Ready for Production**: ✅ Yes
