const express = require('express');
const path = require('path');
const cors = require('cors');
const helmet = require('helmet');
const compression = require('compression');

const app = express();
const PORT = process.env.PORT || 3000;

// Security middleware
app.use(helmet({
    contentSecurityPolicy: {
        directives: {
            defaultSrc: ["'self'"],
            styleSrc: ["'self'", "'unsafe-inline'", "https://fonts.googleapis.com"],
            fontSrc: ["'self'", "https://fonts.gstatic.com"],
            imgSrc: ["'self'", "data:", "https:"],
            scriptSrc: ["'self'", "'unsafe-inline'"],
            connectSrc: ["'self'"]
        }
    }
}));

// CORS middleware
app.use(cors());

// Compression middleware
app.use(compression());

// Body parsing middleware
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Static files middleware
app.use(express.static(path.join(__dirname), {
    maxAge: '1d',
    etag: true,
    lastModified: true
}));

// Routes
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.get('/about', (req, res) => {
    res.sendFile(path.join(__dirname, 'about.html'));
});

app.get('/services', (req, res) => {
    res.sendFile(path.join(__dirname, 'services.html'));
});

app.get('/contact', (req, res) => {
    res.sendFile(path.join(__dirname, 'contact.html'));
});

app.get('/blog', (req, res) => {
    res.sendFile(path.join(__dirname, 'blog.html'));
});

app.get('/testimonials', (req, res) => {
    res.sendFile(path.join(__dirname, 'testimonials.html'));
});

// Service pages
app.get('/cockroach-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'cockroach-control.html'));
});

app.get('/termite-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'termite-control.html'));
});

app.get('/rodent-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'rodent-control.html'));
});

app.get('/bedbug-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'bedbug-control.html'));
});

app.get('/ant-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'ant-control.html'));
});

app.get('/mosquito-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'mosquito-control.html'));
});

app.get('/spider-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'spider-control.html'));
});

app.get('/flies-control', (req, res) => {
    res.sendFile(path.join(__dirname, 'flies-control.html'));
});

// Blog pages
app.get('/cockroach-prevention-guide', (req, res) => {
    res.sendFile(path.join(__dirname, 'cockroach-prevention-guide.html'));
});

app.get('/termite-signs-guide', (req, res) => {
    res.sendFile(path.join(__dirname, 'termite-signs-guide.html'));
});

app.get('/mosquito-control-guide', (req, res) => {
    res.sendFile(path.join(__dirname, 'mosquito-control-guide.html'));
});

app.get('/bedbug-identification-guide', (req, res) => {
    res.sendFile(path.join(__dirname, 'bedbug-identification-guide.html'));
});

app.get('/rodent-control-guide', (req, res) => {
    res.sendFile(path.join(__dirname, 'rodent-control-guide.html'));
});

// Legal pages
app.get('/privacy-policy', (req, res) => {
    res.sendFile(path.join(__dirname, 'privacy-policy.html'));
});

app.get('/terms-conditions', (req, res) => {
    res.sendFile(path.join(__dirname, 'terms-conditions.html'));
});

// API routes for contact form
app.post('/api/contact', (req, res) => {
    const { name, email, phone, message } = req.body;
    
    // Basic validation
    if (!name || !email || !phone) {
        return res.status(400).json({ 
            success: false, 
            message: 'Name, email, and phone are required' 
        });
    }
    
    // Here you would typically save to database or send email
    console.log('Contact form submission:', { name, email, phone, message });
    
    res.json({ 
        success: true, 
        message: 'Thank you for your message. We will contact you soon!' 
    });
});

// Health check endpoint
app.get('/api/health', (req, res) => {
    res.json({ 
        status: 'OK', 
        timestamp: new Date().toISOString(),
        uptime: process.uptime()
    });
});

// 404 handler
app.use((req, res) => {
    res.status(404).sendFile(path.join(__dirname, '404.html'));
});

// Error handler
app.use((err, req, res, next) => {
    console.error(err.stack);
    res.status(500).json({ 
        success: false, 
        message: 'Something went wrong!' 
    });
});

// Start server
app.listen(PORT, () => {
    console.log(`🚀 Famous Pest Control Services website running on port ${PORT}`);
    console.log(`📱 Mobile-friendly website with enhanced navigation`);
    console.log(`🌐 Visit: http://localhost:${PORT}`);
    console.log(`📞 Contact: +91 80006 90006`);
});

module.exports = app;
