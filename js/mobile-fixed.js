// Mobile-Fixed JavaScript with Working Mobile Menu

document.addEventListener('DOMContentLoaded', function() {
    console.log('🚀 Mobile-fixed JavaScript loaded');
    
    // Mobile Menu Elements
    const menuToggle = document.querySelector('.menu-toggle');
    const nav = document.querySelector('.nav');
    const navLinks = document.querySelectorAll('.nav-link');
    const body = document.body;
    const header = document.querySelector('.header');
    
    console.log('Menu toggle element:', menuToggle);
    console.log('Nav element:', nav);

    // Check if elements exist
    if (!menuToggle || !nav) {
        console.error('❌ Mobile menu elements not found');
        return;
    }

    console.log('✅ Mobile menu elements found');

    // Mobile Menu Toggle Function
    function toggleMobileMenu() {
        console.log('🔄 Toggling mobile menu');
        
        // Toggle active classes
        nav.classList.toggle('active');
        menuToggle.classList.toggle('active');
        
        // Prevent body scroll when menu is open
        if (nav.classList.contains('active'))) {
            body.style.overflow = 'hidden';
            console.log('🔒 Body scroll locked');
        } else {
            body.style.overflow = '';
            console.log('🔓 Body scroll unlocked');
        }
        
        // Animate hamburger menu
        const spans = menuToggle.querySelectorAll('span');
        if (menuToggle.classList.contains('active')) {
            spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
            spans[1].style.opacity = '0';
            spans[2].style.transform = 'rotate(-45deg) translate(7px, -6px)';
            console.log('🍔 Hamburger menu animated to X');
        } else {
            spans[0].style.transform = 'none';
            spans[1].style.opacity = '1';
            spans[2].style.transform = 'none';
            console.log('🍔 Hamburger menu reset');
        }
    }

    // Close Mobile Menu Function
    function closeMobileMenu() {
        console.log('❌ Closing mobile menu');
        
        nav.classList.remove('active');
        menuToggle.classList.remove('active');
        body.style.overflow = '';
        
        // Reset hamburger menu
        const spans = menuToggle.querySelectorAll('span');
        spans[0].style.transform = 'none';
        spans[1].style.opacity = '1';
        spans[2].style.transform = 'none';
    }

    // Mobile Menu Toggle Event
    menuToggle.addEventListener('click', function(e) {
        e.preventDefault();
        e.stopPropagation();
        console.log('👆 Menu toggle clicked');
        toggleMobileMenu();
    });

    // Close menu when clicking on nav links
    navLinks.forEach((link, index) => {
        link.addEventListener('click', function(e) {
            console.log(`🔗 Nav link ${index + 1} clicked`);
            closeMobileMenu();
        });
    });

    // Close menu when clicking outside
    document.addEventListener('click', function(e) {
        if (nav.classList.contains('active') && 
            !nav.contains(e.target) && 
            !menuToggle.contains(e.target)) {
            console.log('👆 Clicked outside menu');
            closeMobileMenu();
        }
    });

    // Close menu on window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768 && nav.classList.contains('active')) {
            console.log('📱 Window resized to desktop');
            closeMobileMenu();
        }
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerHeight = header ? header.offsetHeight : 0;
                const targetPosition = target.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
                console.log('📍 Smooth scroll to:', this.getAttribute('href'));
            }
        });
    });

    // Header scroll effect
    let lastScrollTop = 0;
    window.addEventListener('scroll', function() {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        if (scrollTop > 100) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
        
        lastScrollTop = scrollTop;
    });

    // Contact form handling
    const contactForm = document.querySelector('.form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            console.log('📝 Contact form submitted');
            
            const formData = new FormData(this);
            const data = Object.fromEntries(formData);
            
            // Basic validation
            if (!data.name || !data.email || !data.phone) {
                alert('Please fill in all required fields');
                return;
            }
            
            // Here you would typically send to server
            console.log('📧 Form data:', data);
            alert('Thank you for your message! We will contact you soon.');
            this.reset();
        });
    }

    // Service card hover effects
    const serviceCards = document.querySelectorAll('.service-card');
    serviceCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
        });
    });

    // CTA button click tracking
    const ctaButtons = document.querySelectorAll('.cta-button');
    ctaButtons.forEach(button => {
        button.addEventListener('click', function() {
            console.log('🎯 CTA button clicked:', this.textContent.trim());
        });
    });

    // Mobile menu debug info
    console.log('📱 Mobile menu setup complete');
    console.log('🍔 Menu toggle button:', menuToggle ? 'Found' : 'Missing');
    console.log('📋 Navigation menu:', nav ? 'Found' : 'Missing');
    console.log('🔗 Navigation links:', navLinks.length);
    
    // Test mobile menu on small screens
    if (window.innerWidth <= 768) {
        console.log('📱 Mobile device detected');
        console.log('🍔 Menu toggle should be visible');
    } else {
        console.log('💻 Desktop device detected');
        console.log('🍔 Menu toggle should be hidden');
    }
});

// Additional mobile-specific functions
function isMobile() {
    return window.innerWidth <= 768;
}

function showMobileMenu() {
    const nav = document.querySelector('.nav');
    const menuToggle = document.querySelector('.menu-toggle');
    
    if (nav && menuToggle) {
        nav.classList.add('active');
        menuToggle.classList.add('active');
        document.body.style.overflow = 'hidden';
        console.log('📱 Mobile menu shown');
    }
}

function hideMobileMenu() {
    const nav = document.querySelector('.nav');
    const menuToggle = document.querySelector('.menu-toggle');
    
    if (nav && menuToggle) {
        nav.classList.remove('active');
        menuToggle.classList.remove('active');
        document.body.style.overflow = '';
        console.log('📱 Mobile menu hidden');
    }
}

// Export functions for testing
window.mobileMenu = {
    show: showMobileMenu,
    hide: hideMobileMenu,
    isMobile: isMobile
};
