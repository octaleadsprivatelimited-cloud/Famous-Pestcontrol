#!/usr/bin/env python3
"""
Simple HTTP Server for Famous Pest Control Website
Works without Node.js - uses Python's built-in server
"""

import http.server
import socketserver
import webbrowser
import os
import sys
from pathlib import Path

# Configuration
PORT = 3000
HOST = 'localhost'

class CustomHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    """Custom handler to serve HTML files with proper MIME types"""
    
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=os.getcwd(), **kwargs)
    
    def end_headers(self):
        # Add CORS headers for local development
        self.send_header('Access-Control-Allow-Origin', '*')
        self.send_header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS')
        self.send_header('Access-Control-Allow-Headers', 'Content-Type')
        super().end_headers()
    
    def do_GET(self):
        # Handle root path
        if self.path == '/':
            self.path = '/index-mobile-fixed.html'
        elif self.path == '/about':
            self.path = '/about.html'
        elif self.path == '/services':
            self.path = '/services.html'
        elif self.path == '/contact':
            self.path = '/contact.html'
        elif self.path == '/blog':
            self.path = '/blog.html'
        elif self.path == '/testimonials':
            self.path = '/testimonials.html'
        elif self.path == '/cockroach-control':
            self.path = '/cockroach-control.html'
        elif self.path == '/termite-control':
            self.path = '/termite-control.html'
        elif self.path == '/rodent-control':
            self.path = '/rodent-control.html'
        elif self.path == '/bedbug-control':
            self.path = '/bedbug-control.html'
        elif self.path == '/ant-control':
            self.path = '/ant-control.html'
        elif self.path == '/mosquito-control':
            self.path = '/mosquito-control.html'
        elif self.path == '/spider-control':
            self.path = '/spider-control.html'
        elif self.path == '/flies-control':
            self.path = '/flies-control.html'
        elif self.path == '/privacy-policy':
            self.path = '/privacy-policy.html'
        elif self.path == '/terms-conditions':
            self.path = '/terms-conditions.html'
        
        # Set proper MIME types
        if self.path.endswith('.css'):
            self.send_header('Content-Type', 'text/css')
        elif self.path.endswith('.js'):
            self.send_header('Content-Type', 'application/javascript')
        elif self.path.endswith('.html'):
            self.send_header('Content-Type', 'text/html')
        elif self.path.endswith('.webp'):
            self.send_header('Content-Type', 'image/webp')
        elif self.path.endswith('.svg'):
            self.send_header('Content-Type', 'image/svg+xml')
        elif self.path.endswith('.png'):
            self.send_header('Content-Type', 'image/png')
        elif self.path.endswith('.jpg') or self.path.endswith('.jpeg'):
            self.send_header('Content-Type', 'image/jpeg')
        
        return super().do_GET()
    
    def do_POST(self):
        # Handle contact form submissions
        if self.path == '/api/contact':
            content_length = int(self.headers['Content-Length'])
            post_data = self.rfile.read(content_length)
            
            # Simple form data parsing
            form_data = {}
            if post_data:
                data_str = post_data.decode('utf-8')
                for pair in data_str.split('&'):
                    if '=' in pair:
                        key, value = pair.split('=', 1)
                        form_data[key] = value.replace('+', ' ').replace('%40', '@')
            
            # Log the form submission
            print(f"📝 Contact form submitted: {form_data}")
            
            # Send JSON response
            self.send_response(200)
            self.send_header('Content-Type', 'application/json')
            self.end_headers()
            response = '{"success": true, "message": "Thank you for your message! We will contact you soon."}'
            self.wfile.write(response.encode('utf-8'))
            return
        
        # Default POST handling
        return super().do_POST()

def start_server():
    """Start the local development server"""
    
    print("🚀 Starting Famous Pest Control Services Website")
    print("=" * 50)
    
    # Check if we're in the right directory
    if not os.path.exists('index-mobile-fixed.html'):
        print("❌ Error: index-mobile-fixed.html not found!")
        print("Please run this script from the website directory.")
        return False
    
    try:
        # Create server
        with socketserver.TCPServer((HOST, PORT), CustomHTTPRequestHandler) as httpd:
            print(f"✅ Server started successfully!")
            print(f"🌐 Website URL: http://{HOST}:{PORT}")
            print(f"📱 Mobile-friendly with working mobile menu")
            print(f"📞 Contact: +91 80006 90006")
            print()
            print("🔧 Mobile Menu Testing:")
            print("1. Open the website in your browser")
            print("2. Resize browser to mobile size (768px or less)")
            print("3. Click the hamburger menu button")
            print("4. Menu should open with smooth animation")
            print("5. Click outside or on links to close")
            print()
            print("📋 Press Ctrl+C to stop the server")
            print("=" * 50)
            
            # Open browser automatically
            try:
                webbrowser.open(f'http://{HOST}:{PORT}')
                print("🌐 Browser opened automatically")
            except:
                print("⚠️  Could not open browser automatically")
                print(f"   Please manually open: http://{HOST}:{PORT}")
            
            # Start serving
            httpd.serve_forever()
            
    except OSError as e:
        if e.errno == 10048:  # Port already in use
            print(f"❌ Port {PORT} is already in use!")
            print("Please close other applications using this port or change the PORT variable.")
        else:
            print(f"❌ Error starting server: {e}")
        return False
    except KeyboardInterrupt:
        print("\n🛑 Server stopped by user")
        return True
    except Exception as e:
        print(f"❌ Unexpected error: {e}")
        return False

if __name__ == "__main__":
    print("🐍 Python HTTP Server for Famous Pest Control Website")
    print("📱 Mobile-friendly with working mobile menu")
    print()
    
    success = start_server()
    
    if success:
        print("✅ Server stopped successfully")
    else:
        print("❌ Server failed to start")
        sys.exit(1)
