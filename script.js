document.addEventListener('DOMContentLoaded', function() {
    // Setup mobile menu toggle logic
    function setupMenuToggle() {
        const menuToggle = document.querySelector('.menu-toggle');
        const navLinks = document.querySelector('.nav-links');
        if (menuToggle && navLinks) {
            menuToggle.addEventListener('click', function() {
                navLinks.classList.toggle('show-nav');
            });
        }
    }

    // If header is loaded dynamically, wait for it then setup menu toggle
    const headerDiv = document.getElementById('header');
    if (headerDiv) {
        // If header is already loaded (not dynamic), setup immediately
        if (headerDiv.innerHTML.trim().length > 0) {
            setupMenuToggle();
        } else {
            // Listen for header load via fetch
            const observer = new MutationObserver(function(mutations, obs) {
                if (headerDiv.innerHTML.trim().length > 0) {
                    setupMenuToggle();
                    obs.disconnect();
                }
            });
            observer.observe(headerDiv, { childList: true });
        }
    } else {
        setupMenuToggle();
    }

    // Smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();

            const targetId = this.getAttribute('href');
            if (targetId === '#') return;

            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                window.scrollTo({
                    top: targetElement.offsetTop - 80,
                    behavior: 'smooth'
                });
            }
        });
    });

    // Form submission
    const contactForm = document.getElementById('contactForm');
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();

            // Get form values
            const name = document.getElementById('name').value;
            const email = document.getElementById('email').value;
            const subject = document.getElementById('subject').value;
            const message = document.getElementById('message').value;

            // In a real implementation, you would send this data to a server
            // For now, just show an alert
            alert(`Thank you for your message, ${name}! I'll get back to you soon.`);

            // Reset form
            contactForm.reset();
        });
    }

    // Intersection Observer for scroll animations
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };

    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate');
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);

    // Observe elements that should animate on scroll
    document.querySelectorAll('.highlight-card, .principle-card, .featured-content, .featured-image, .about-image, .about-content, .experience-item, .contact-method').forEach(element => {
        element.classList.add('fade-in');
        observer.observe(element);
    });

    // Add some additional CSS for animations
    const style = document.createElement('style');
    style.textContent = `
        .fade-in {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease-out, transform 0.6s ease-out;
        }

        .fade-in.animate {
            opacity: 1;
            transform: translateY(0);
        }

        .show-nav {
            display: flex !important;
            flex-direction: column;
            position: absolute;
            top: 5rem;
            right: 0;
            width: 100%;
            background: white;
            padding: 2rem;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            z-index: 999;
        }
    `;
    document.head.appendChild(style);
});
