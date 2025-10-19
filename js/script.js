// DOM Content Loaded
document.addEventListener('DOMContentLoaded', function() {
    // Enhanced Mobile Menu Toggle
    const menuToggle = document.querySelector('.menu-toggle');
    const nav = document.querySelector('.nav');
    const navLinks = document.querySelectorAll('.nav-link');
    const body = document.body;

    // Toggle mobile menu with enhanced functionality
    if (menuToggle) {
        menuToggle.addEventListener('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            
            nav.classList.toggle('active');
            menuToggle.classList.toggle('active');
            
            // Prevent body scroll when menu is open
            if (nav.classList.contains('active')) {
                body.style.overflow = 'hidden';
            } else {
                body.style.overflow = '';
            }
            
            // Animate hamburger menu
            const spans = menuToggle.querySelectorAll('span');
            if (menuToggle.classList.contains('active')) {
                spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
                spans[1].style.opacity = '0';
                spans[2].style.transform = 'rotate(-45deg) translate(7px, -6px)';
            } else {
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            }
        });
    }

    // Close mobile menu when clicking on nav links
    navLinks.forEach(link => {
        link.addEventListener('click', function() {
            if (nav.classList.contains('active')) {
                nav.classList.remove('active');
                menuToggle.classList.remove('active');
                body.style.overflow = '';
                
                // Reset hamburger menu
                const spans = menuToggle.querySelectorAll('span');
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            }
        });
    });

    // Close mobile menu when clicking outside
    document.addEventListener('click', function(e) {
        if (nav.classList.contains('active') && 
            !nav.contains(e.target) && 
            !menuToggle.contains(e.target)) {
            nav.classList.remove('active');
            menuToggle.classList.remove('active');
            body.style.overflow = '';
            
            // Reset hamburger menu
            const spans = menuToggle.querySelectorAll('span');
            spans[0].style.transform = 'none';
            spans[1].style.opacity = '1';
            spans[2].style.transform = 'none';
        }
    });

    // Close mobile menu on window resize
    window.addEventListener('resize', function() {
        if (window.innerWidth > 768 && nav.classList.contains('active')) {
            nav.classList.remove('active');
            menuToggle.classList.remove('active');
            body.style.overflow = '';
            
            // Reset hamburger menu
            const spans = menuToggle.querySelectorAll('span');
            spans[0].style.transform = 'none';
            spans[1].style.opacity = '1';
            spans[2].style.transform = 'none';
        }
    });

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerHeight = document.querySelector('.header').offsetHeight;
                const targetPosition = target.offsetTop - headerHeight;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Header scroll effect
    const header = document.querySelector('.header');
    let lastScrollTop = 0;

    window.addEventListener('scroll', function() {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        if (scrollTop > 100) {
            header.style.background = 'rgba(255, 255, 255, 0.95)';
            header.style.backdropFilter = 'blur(10px)';
        } else {
            header.style.background = '#fff';
            header.style.backdropFilter = 'none';
        }

        // Hide/show header on scroll
        if (scrollTop > lastScrollTop && scrollTop > 200) {
            header.style.transform = 'translateY(-100%)';
        } else {
            header.style.transform = 'translateY(0)';
        }
        
        lastScrollTop = scrollTop;
    });

    // Intersection Observer for fade-in animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, observerOptions);

    // Observe elements for animation
    const animatedElements = document.querySelectorAll('.service-card, .testimonial-card, .about-content, .contact-content');
    animatedElements.forEach(el => {
        el.classList.add('fade-in');
        observer.observe(el);
    });

    // Form submission handling
    const contactForm = document.querySelector('.form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(contactForm);
            const name = contactForm.querySelector('input[type="text"]').value;
            const phone = contactForm.querySelector('input[type="tel"]').value;
            const email = contactForm.querySelector('input[type="email"]').value;
            const message = contactForm.querySelector('textarea').value;
            
            // Basic validation
            if (!name || !phone || !email) {
                alert('Please fill in all required fields.');
                return;
            }
            
            // Phone number validation
            const phoneRegex = /^[6-9]\d{9}$/;
            if (!phoneRegex.test(phone.replace(/\D/g, ''))) {
                alert('Please enter a valid 10-digit phone number.');
                return;
            }
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address.');
                return;
            }
            
            // Show loading state
            const submitButton = contactForm.querySelector('button[type="submit"]');
            const originalText = submitButton.textContent;
            submitButton.innerHTML = '<span class="loading"></span> Sending...';
            submitButton.disabled = true;
            
            // Simulate form submission (replace with actual form handling)
            setTimeout(() => {
                // Create WhatsApp message
                const whatsappMessage = `Hi, I'm interested in your pest control services.
                
Name: ${name}
Phone: ${phone}
Email: ${email}
Message: ${message}

Please contact me for more information.`;
                
                const whatsappUrl = `https://wa.me/918000690006?text=${encodeURIComponent(whatsappMessage)}`;
                
                // Open WhatsApp
                window.open(whatsappUrl, '_blank');
                
                // Reset form
                contactForm.reset();
                submitButton.textContent = originalText;
                submitButton.disabled = false;
                
                // Show success message
                alert('Thank you for your interest! We will contact you soon.');
            }, 2000);
        });
    }

    // Phone number click tracking
    const phoneLinks = document.querySelectorAll('a[href^="tel:"]');
    phoneLinks.forEach(link => {
        link.addEventListener('click', function() {
            // Track phone clicks (you can integrate with analytics here)
            console.log('Phone number clicked:', this.href);
        });
    });

    // WhatsApp click tracking
    const whatsappLinks = document.querySelectorAll('a[href*="wa.me"]');
    whatsappLinks.forEach(link => {
        link.addEventListener('click', function() {
            // Track WhatsApp clicks (you can integrate with analytics here)
            console.log('WhatsApp clicked:', this.href);
        });
    });

    // Service card hover effects
    const serviceCards = document.querySelectorAll('.service-card');
    serviceCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });

    // Testimonial card hover effects
    const testimonialCards = document.querySelectorAll('.testimonial-card');
    testimonialCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-5px)';
            this.style.boxShadow = '0 15px 35px rgba(0, 0, 0, 0.15)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 5px 20px rgba(0, 0, 0, 0.1)';
        });
    });

    // CTA button click tracking
    const ctaButtons = document.querySelectorAll('.cta-button');
    ctaButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Track CTA clicks (you can integrate with analytics here)
            console.log('CTA button clicked:', this.textContent);
        });
    });

    // Lazy loading for images
    const images = document.querySelectorAll('img[data-src]');
    const imageObserver = new IntersectionObserver((entries, observer) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                img.src = img.dataset.src;
                img.classList.remove('lazy');
                imageObserver.unobserve(img);
            }
        });
    });

    images.forEach(img => imageObserver.observe(img));

    // Add loading states to external links
    const externalLinks = document.querySelectorAll('a[href^="http"]');
    externalLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Add loading indicator for external links
            const originalText = this.textContent;
            this.textContent = 'Loading...';
            this.style.opacity = '0.7';
            
            // Reset after a short delay
            setTimeout(() => {
                this.textContent = originalText;
                this.style.opacity = '1';
            }, 1000);
        });
    });

    // Keyboard navigation support
    document.addEventListener('keydown', function(e) {
        // Close mobile menu with Escape key
        if (e.key === 'Escape' && nav.classList.contains('active')) {
            nav.classList.remove('active');
            menuToggle.classList.remove('active');
            
            // Reset hamburger menu
            const spans = menuToggle.querySelectorAll('span');
            spans[0].style.transform = 'none';
            spans[1].style.opacity = '1';
            spans[2].style.transform = 'none';
        }
    });

    // Add focus styles for accessibility
    const focusableElements = document.querySelectorAll('a, button, input, textarea');
    focusableElements.forEach(element => {
        element.addEventListener('focus', function() {
            this.style.outline = '2px solid #ff6600';
            this.style.outlineOffset = '2px';
        });
        
        element.addEventListener('blur', function() {
            this.style.outline = 'none';
        });
    });

    // Performance optimization: Debounce scroll events
    function debounce(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    }

    // Apply debouncing to scroll events
    const debouncedScrollHandler = debounce(function() {
        // Any scroll-based functionality can be added here
    }, 100);

    window.addEventListener('scroll', debouncedScrollHandler);

    // Initialize tooltips for better UX
    const tooltipElements = document.querySelectorAll('[data-tooltip]');
    tooltipElements.forEach(element => {
        element.addEventListener('mouseenter', function() {
            const tooltip = document.createElement('div');
            tooltip.className = 'tooltip';
            tooltip.textContent = this.dataset.tooltip;
            tooltip.style.cssText = `
                position: absolute;
                background: #333;
                color: #fff;
                padding: 8px 12px;
                border-radius: 4px;
                font-size: 14px;
                z-index: 1000;
                pointer-events: none;
                opacity: 0;
                transition: opacity 0.3s ease;
            `;
            
            document.body.appendChild(tooltip);
            
            const rect = this.getBoundingClientRect();
            tooltip.style.left = rect.left + (rect.width / 2) - (tooltip.offsetWidth / 2) + 'px';
            tooltip.style.top = rect.top - tooltip.offsetHeight - 8 + 'px';
            
            setTimeout(() => tooltip.style.opacity = '1', 10);
            
            this.addEventListener('mouseleave', function() {
                tooltip.style.opacity = '0';
                setTimeout(() => document.body.removeChild(tooltip), 300);
            });
        });
    });

    // Gallery filtering functionality
    const galleryFilterBtns = document.querySelectorAll('.filter-btn');
    const galleryItems = document.querySelectorAll('.gallery-item');
    
    galleryFilterBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            
            // Update active button
            galleryFilterBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // Filter gallery items
            galleryItems.forEach(item => {
                if (filter === 'all' || item.getAttribute('data-category') === filter) {
                    item.style.display = 'block';
                    item.style.opacity = '0';
                    setTimeout(() => {
                        item.style.opacity = '1';
                    }, 100);
                } else {
                    item.style.opacity = '0';
                    setTimeout(() => {
                        item.style.display = 'none';
                    }, 300);
                }
            });
        });
    });

    // FAQ functionality
    const faqItems = document.querySelectorAll('.faq-item');
    faqItems.forEach(item => {
        const question = item.querySelector('.faq-question');
        question.addEventListener('click', function() {
            const isActive = item.classList.contains('active');
            
            // Close all FAQ items
            faqItems.forEach(faq => faq.classList.remove('active'));
            
            // Open clicked item if it wasn't active
            if (!isActive) {
                item.classList.add('active');
            }
        });
    });

    // FAQ category filtering
    const faqCategoryBtns = document.querySelectorAll('.category-btn');
    const faqSections = document.querySelectorAll('.faq-section');
    
    faqCategoryBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const category = this.getAttribute('data-category');
            
            // Update active button
            faqCategoryBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // Show corresponding section
            faqSections.forEach(section => {
                section.classList.remove('active');
                if (section.getAttribute('data-category') === category) {
                    section.classList.add('active');
                }
            });
        });
    });

    // Testimonials filtering
    const testimonialFilterBtns = document.querySelectorAll('.testimonials-filter .filter-btn');
    const testimonialItems = document.querySelectorAll('.testimonial-item');
    
    testimonialFilterBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const filter = this.getAttribute('data-filter');
            
            // Update active button
            testimonialFilterBtns.forEach(b => b.classList.remove('active'));
            this.classList.add('active');
            
            // Filter testimonial items
            testimonialItems.forEach(item => {
                if (filter === 'all' || item.getAttribute('data-category') === filter) {
                    item.style.display = 'block';
                    item.style.opacity = '0';
                    setTimeout(() => {
                        item.style.opacity = '1';
                    }, 100);
                } else {
                    item.style.opacity = '0';
                    setTimeout(() => {
                        item.style.display = 'none';
                    }, 300);
                }
            });
        });
    });

    // Newsletter form handling
    const newsletterForm = document.querySelector('.newsletter-form');
    if (newsletterForm) {
        newsletterForm.addEventListener('submit', function(e) {
            e.preventDefault();
            const email = this.querySelector('input[type="email"]').value;
            
            if (email) {
                // Show success message
                const button = this.querySelector('button');
                const originalText = button.textContent;
                button.textContent = 'Subscribed!';
                button.style.background = '#28a745';
                
                setTimeout(() => {
                    button.textContent = originalText;
                    button.style.background = '#fff';
                    this.reset();
                }, 2000);
            }
        });
    }

    // Contact form enhanced validation
    const contactForm = document.querySelector('.contact-form');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // Get form data
            const formData = new FormData(this);
            const name = this.querySelector('input[name="name"]').value;
            const phone = this.querySelector('input[name="phone"]').value;
            const email = this.querySelector('input[name="email"]').value;
            const service = this.querySelector('select[name="service"]').value;
            const propertyType = this.querySelector('select[name="property-type"]').value;
            const address = this.querySelector('textarea[name="address"]').value;
            const message = this.querySelector('textarea[name="message"]').value;
            const emergency = this.querySelector('input[name="emergency"]').checked;
            
            // Enhanced validation
            if (!name || !phone || !email) {
                showAlert('Please fill in all required fields.', 'error');
                return;
            }
            
            // Phone number validation
            const phoneRegex = /^[6-9]\d{9}$/;
            if (!phoneRegex.test(phone.replace(/\D/g, ''))) {
                showAlert('Please enter a valid 10-digit phone number.', 'error');
                return;
            }
            
            // Email validation
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                showAlert('Please enter a valid email address.', 'error');
                return;
            }
            
            // Show loading state
            const submitButton = this.querySelector('button[type="submit"]');
            const originalText = submitButton.textContent;
            submitButton.innerHTML = '<span class="loading"></span> Sending...';
            submitButton.disabled = true;
            
            // Simulate form submission
            setTimeout(() => {
                // Create WhatsApp message
                let whatsappMessage = `Hi, I'm interested in your pest control services.\n\n`;
                whatsappMessage += `Name: ${name}\n`;
                whatsappMessage += `Phone: ${phone}\n`;
                whatsappMessage += `Email: ${email}\n`;
                if (service) whatsappMessage += `Service Required: ${service}\n`;
                if (propertyType) whatsappMessage += `Property Type: ${propertyType}\n`;
                if (address) whatsappMessage += `Address: ${address}\n`;
                if (message) whatsappMessage += `Message: ${message}\n`;
                if (emergency) whatsappMessage += `\n🚨 EMERGENCY SERVICE REQUEST\n`;
                whatsappMessage += `\nPlease contact me for more information.`;
                
                const whatsappUrl = `https://wa.me/918000690006?text=${encodeURIComponent(whatsappMessage)}`;
                
                // Open WhatsApp
                window.open(whatsappUrl, '_blank');
                
                // Reset form
                this.reset();
                submitButton.textContent = originalText;
                submitButton.disabled = false;
                
                // Show success message
                showAlert('Thank you for your interest! We will contact you soon.', 'success');
            }, 2000);
        });
    }

    // Alert function
    function showAlert(message, type = 'info') {
        const alert = document.createElement('div');
        alert.className = `alert alert-${type}`;
        alert.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 15px 20px;
            border-radius: 6px;
            color: #fff;
            font-weight: 500;
            z-index: 10000;
            max-width: 400px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transform: translateX(100%);
            transition: transform 0.3s ease;
        `;
        
        if (type === 'success') {
            alert.style.background = '#28a745';
        } else if (type === 'error') {
            alert.style.background = '#dc3545';
        } else {
            alert.style.background = '#17a2b8';
        }
        
        alert.textContent = message;
        document.body.appendChild(alert);
        
        // Animate in
        setTimeout(() => {
            alert.style.transform = 'translateX(0)';
        }, 100);
        
        // Auto remove
        setTimeout(() => {
            alert.style.transform = 'translateX(100%)';
            setTimeout(() => {
                document.body.removeChild(alert);
            }, 300);
        }, 5000);
    }

    // Smooth scrolling for all anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                const headerHeight = document.querySelector('.header').offsetHeight;
                const targetPosition = target.offsetTop - headerHeight - 20;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Enhanced mobile menu functionality
    const mobileMenuToggle = document.querySelector('.menu-toggle');
    const mobileNav = document.querySelector('.nav');
    
    if (mobileMenuToggle && mobileNav) {
        mobileMenuToggle.addEventListener('click', function() {
            mobileNav.classList.toggle('active');
            this.classList.toggle('active');
            
            // Animate hamburger menu
            const spans = this.querySelectorAll('span');
            if (this.classList.contains('active')) {
                spans[0].style.transform = 'rotate(45deg) translate(5px, 5px)';
                spans[1].style.opacity = '0';
                spans[2].style.transform = 'rotate(-45deg) translate(7px, -6px)';
            } else {
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            }
        });

        // Close mobile menu when clicking outside
        document.addEventListener('click', function(e) {
            if (!mobileNav.contains(e.target) && !mobileMenuToggle.contains(e.target)) {
                mobileNav.classList.remove('active');
                mobileMenuToggle.classList.remove('active');
                
                const spans = mobileMenuToggle.querySelectorAll('span');
                spans[0].style.transform = 'none';
                spans[1].style.opacity = '1';
                spans[2].style.transform = 'none';
            }
        });
    }

    // Enhanced scroll effects
    let ticking = false;
    function updateScrollEffects() {
        const scrollTop = window.pageYOffset || document.documentElement.scrollTop;
        
        // Header background change
        const header = document.querySelector('.header');
        if (scrollTop > 100) {
            header.style.background = 'rgba(255, 255, 255, 0.95)';
            header.style.backdropFilter = 'blur(10px)';
        } else {
            header.style.background = '#fff';
            header.style.backdropFilter = 'none';
        }
        
        ticking = false;
    }

    function requestScrollUpdate() {
        if (!ticking) {
            requestAnimationFrame(updateScrollEffects);
            ticking = true;
        }
    }

    window.addEventListener('scroll', requestScrollUpdate);

    // Enhanced intersection observer for animations
    const animationObserver = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('visible');
            }
        });
    }, {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    });

    // Observe all animated elements
    const animatedElements = document.querySelectorAll(
        '.service-card, .testimonial-card, .about-content, .contact-content, ' +
        '.value-card, .team-member, .cert-item, .advantage, .gallery-item, ' +
        '.article-card, .pricing-card, .package-card, .maintenance-card, ' +
        '.trust-item, .process-step, .step, .faq-item, .contact-card'
    );
    
    animatedElements.forEach(el => {
        el.classList.add('fade-in');
        animationObserver.observe(el);
    });

    // Enhanced form validation
    const formInputs = document.querySelectorAll('input, textarea, select');
    formInputs.forEach(input => {
        input.addEventListener('blur', function() {
            validateField(this);
        });
        
        input.addEventListener('input', function() {
            if (this.classList.contains('error')) {
                validateField(this);
            }
        });
    });

    function validateField(field) {
        const value = field.value.trim();
        const fieldType = field.type;
        const isRequired = field.hasAttribute('required');
        
        // Remove existing error styling
        field.classList.remove('error');
        const existingError = field.parentNode.querySelector('.field-error');
        if (existingError) {
            existingError.remove();
        }
        
        let isValid = true;
        let errorMessage = '';
        
        if (isRequired && !value) {
            isValid = false;
            errorMessage = 'This field is required.';
        } else if (value) {
            if (fieldType === 'email') {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(value)) {
                    isValid = false;
                    errorMessage = 'Please enter a valid email address.';
                }
            } else if (fieldType === 'tel') {
                const phoneRegex = /^[6-9]\d{9}$/;
                if (!phoneRegex.test(value.replace(/\D/g, ''))) {
                    isValid = false;
                    errorMessage = 'Please enter a valid 10-digit phone number.';
                }
            }
        }
        
        if (!isValid) {
            field.classList.add('error');
            const errorDiv = document.createElement('div');
            errorDiv.className = 'field-error';
            errorDiv.style.cssText = `
                color: #dc3545;
                font-size: 0.875rem;
                margin-top: 0.25rem;
            `;
            errorDiv.textContent = errorMessage;
            field.parentNode.appendChild(errorDiv);
        }
        
        return isValid;
    }

    // Add error styling to CSS
    const style = document.createElement('style');
    style.textContent = `
        .field-error {
            color: #dc3545;
            font-size: 0.875rem;
            margin-top: 0.25rem;
        }
        input.error, textarea.error, select.error {
            border-color: #dc3545 !important;
            box-shadow: 0 0 0 0.2rem rgba(220, 53, 69, 0.25);
        }
    `;
    document.head.appendChild(style);

    console.log('Famous Pest Control Services website loaded successfully with enhanced functionality!');
});
