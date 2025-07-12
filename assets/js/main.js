// Main JavaScript file for sysopsninjas.github.io

document.addEventListener('DOMContentLoaded', function() {
    console.log('SysOps Ninjas site loaded successfully!');
    
    // Add your JavaScript functionality here
    initializeNavigation();
    initializeTutorials();
});

function initializeNavigation() {
    // Navigation functionality
    const navLinks = document.querySelectorAll('nav a');
    navLinks.forEach(link => {
        link.addEventListener('click', function(e) {
            // Add smooth scrolling or other navigation features
        });
    });
}

function initializeTutorials() {
    // Tutorial-specific functionality
    const tutorialCards = document.querySelectorAll('.tutorial-card');
    tutorialCards.forEach(card => {
        card.addEventListener('click', function() {
            // Handle tutorial card interactions
        });
    });
}
