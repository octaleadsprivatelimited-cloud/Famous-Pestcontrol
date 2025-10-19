#!/usr/bin/env python3
import http.server
import socketserver
import webbrowser
import os
import sys

# Change to the website directory
os.chdir(r'C:\Users\navya\pestdial-website')

PORT = 8000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header('Cache-Control', 'no-cache, no-store, must-revalidate')
        self.send_header('Pragma', 'no-cache')
        self.send_header('Expires', '0')
        super().end_headers()

    def do_GET(self):
        if self.path == '/':
            self.path = '/index.html'
        return super().do_GET()

try:
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        print(f"🚀 Famous Pest Control Services website is running!")
        print(f"📱 Local URL: http://localhost:{PORT}")
        print(f"🌐 Network URL: http://127.0.0.1:{PORT}")
        print(f"📁 Serving from: {os.getcwd()}")
        print(f"⏹️  Press Ctrl+C to stop the server")
        print("-" * 50)
        
        # Try to open the browser automatically
        try:
            webbrowser.open(f'http://localhost:{PORT}')
            print("🌐 Browser opened automatically")
        except:
            print("⚠️  Could not open browser automatically")
            print(f"🔗 Please open http://localhost:{PORT} in your browser")
        
        httpd.serve_forever()
        
except KeyboardInterrupt:
    print("\n🛑 Server stopped by user")
    sys.exit(0)
except OSError as e:
    if e.errno == 10048:  # Port already in use
        print(f"❌ Port {PORT} is already in use")
        print("💡 Try closing other applications or use a different port")
    else:
        print(f"❌ Error starting server: {e}")
    sys.exit(1)
except Exception as e:
    print(f"❌ Unexpected error: {e}")
    sys.exit(1)
