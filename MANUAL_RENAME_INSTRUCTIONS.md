# 📁 Rename Folder to "Famous Pest Control Services"

## 🎯 **Manual Rename Instructions**

### **Step 1: Close All Programs**
1. **Close all file explorers** (Windows Explorer)
2. **Close all terminals/command prompts**
3. **Close any text editors** (VS Code, Notepad, etc.)
4. **Close any browsers** that might be accessing the folder

### **Step 2: Rename the Folder**

#### **Method A: Using File Explorer (Easiest)**
1. **Open File Explorer**
2. **Navigate to**: `C:\Users\navya\`
3. **Right-click** on the `pestdial-website` folder
4. **Select**: "Rename"
5. **Type**: `Famous Pest Control Services`
6. **Press**: Enter

#### **Method B: Using Command Prompt**
1. **Open Command Prompt as Administrator**
2. **Navigate to parent directory**:
   ```cmd
   cd C:\Users\navya
   ```
3. **Rename the folder**:
   ```cmd
   ren "pestdial-website" "Famous Pest Control Services"
   ```

#### **Method C: Using PowerShell**
1. **Open PowerShell as Administrator**
2. **Navigate to parent directory**:
   ```powershell
   cd C:\Users\navya
   ```
3. **Rename the folder**:
   ```powershell
   Rename-Item -Path "pestdial-website" -NewName "Famous Pest Control Services"
   ```

### **Step 3: Verify the Rename**
1. **Check** that the folder is now named: `Famous Pest Control Services`
2. **Navigate** to the new folder: `C:\Users\navya\Famous Pest Control Services`
3. **Verify** all your website files are still there

## 📁 **After Renaming**

### **New Folder Structure:**
```
C:\Users\navya\Famous Pest Control Services\
├── index.html
├── about.html
├── services.html
├── contact.html
├── blog.html
├── testimonials.html
├── privacy-policy.html
├── terms-conditions.html
├── [8 service pages]
├── [5 blog pages]
├── css/
├── js/
├── images/
├── sitemap.xml
├── robots.txt
├── README.md
└── [all other files]
```

### **Update Your Workflow:**
- **New working directory**: `C:\Users\navya\Famous Pest Control Services`
- **All file paths** remain the same
- **Website functionality** unchanged
- **Upload to GitHub** process remains the same

## 🚀 **Continue with Upload**

After renaming, you can continue with the GitHub upload:

1. **Navigate to new folder**:
   ```cmd
   cd "C:\Users\navya\Famous Pest Control Services"
   ```

2. **Run upload script**:
   ```cmd
   upload_website.bat
   ```

3. **Or use GitHub Desktop** with the new folder path

## ✅ **Benefits of Renaming**

- ✅ **Professional folder name** matches your business
- ✅ **Better organization** for your projects
- ✅ **Clear identification** of the website project
- ✅ **No impact** on website functionality
- ✅ **Same upload process** to GitHub

---

**Current Path**: `C:\Users\navya\pestdial-website`  
**New Path**: `C:\Users\navya\Famous Pest Control Services`  
**Status**: Ready for rename ✅
