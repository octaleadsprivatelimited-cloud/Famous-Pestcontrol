import http.server
import socketserver
import webbrowser
import os

PORT = 3000

class MyHTTPRequestHandler(http.server.SimpleHTTPRequestHandler):
    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=os.getcwd(), **kwargs)
    
    def do_GET(self):
        if self.path == '/':
            self.path = '/index-mobile-fixed.html'
        return super().do_GET()

print("🚀 Starting Famous Pest Control Services Website")
print(f"🌐 Server running on: http://localhost:{PORT}")
print("📱 Mobile-friendly with working mobile menu")
print("📞 Contact: +91 80006 90006")
print()
print("🔧 Mobile Menu Testing:")
print("1. Open the website in your browser")
print("2. Resize browser to mobile size (768px or less)")
print("3. Click the hamburger menu button")
print("4. Menu should open with smooth animation")
print("5. Click outside or on links to close")
print()
print("Press Ctrl+C to stop the server")
print("=" * 50)

try:
    with socketserver.TCPServer(("", PORT), MyHTTPRequestHandler) as httpd:
        webbrowser.open(f'http://localhost:{PORT}')
        print("🌐 Browser opened automatically")
        httpd.serve_forever()
except KeyboardInterrupt:
    print("\n🛑 Server stopped")
except OSError as e:
    if e.errno == 10048:
        print(f"❌ Port {PORT} is already in use!")
        print("Please close other applications using this port.")
    else:
        print(f"❌ Error: {e}")
except Exception as e:
    print(f"❌ Unexpected error: {e}")
