#!/bin/bash

# Setup script for sysopsninjas.github.io project structure
# This script creates the complete directory structure for your GitHub Pages site

echo "🚀 Setting up sysopsninjas.github.io project structure..."

# Create main directories
echo "📁 Creating main directories..."
mkdir -p .github/workflows
mkdir -p assets/{css,js,images}
mkdir -p docs
mkdir -p tools
mkdir -p tutorials

# Create GitHub Actions workflow file
echo "⚙️ Creating GitHub Actions workflow..."
cat > .github/workflows/deploy.yml << 'EOF'
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

jobs:
  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Pages
        uses: actions/configure-pages@v4
      
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: '.'
      
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
EOF

# Create basic CSS structure
echo "🎨 Creating basic CSS files..."
cat > assets/css/style.css << 'EOF'
/* Main stylesheet for sysopsninjas.github.io */
:root {
  --primary-color: #2c3e50;
  --secondary-color: #3498db;
  --accent-color: #e74c3c;
  --text-color: #333;
  --bg-color: #f8f9fa;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  line-height: 1.6;
  color: var(--text-color);
  background-color: var(--bg-color);
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding: 0 20px;
}

/* Add more styles as needed */
EOF

# Create basic JavaScript file
echo "⚡ Creating basic JavaScript files..."
cat > assets/js/main.js << 'EOF'
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
EOF

# Create placeholder files for organization
echo "📄 Creating placeholder files..."

# Assets placeholders
touch assets/images/.gitkeep
cat > assets/css/README.md << 'EOF'
# CSS Directory

This directory contains all stylesheet files for the sysopsninjas.github.io project.

## Files:
- `style.css` - Main stylesheet
- Add component-specific CSS files as needed

## Usage:
Include CSS files in your HTML using:
```html
<link rel="stylesheet" href="assets/css/style.css">
```
EOF

cat > assets/js/README.md << 'EOF'
# JavaScript Directory

This directory contains all JavaScript files for the sysopsninjas.github.io project.

## Files:
- `main.js` - Main JavaScript file
- Add component-specific JS files as needed

## Usage:
Include JavaScript files in your HTML using:
```html
<script src="assets/js/main.js"></script>
```
EOF

# Documentation structure
cat > docs/README.md << 'EOF'
# Documentation

This directory contains all documentation for the sysopsninjas.github.io project.

## Structure:
- Add API documentation
- User guides
- Development guides
- Configuration documentation

## Contributing:
When adding new documentation, please follow the established format and include:
- Clear headings
- Code examples where applicable
- Step-by-step instructions
EOF

# Tools directory
cat > tools/README.md << 'EOF'
# Tools Directory

This directory contains utility scripts and tools for the sysopsninjas.github.io project.

## Contents:
- Deployment scripts
- Build tools
- Utility scripts
- Development helpers

## Usage:
Make scripts executable before running:
```bash
chmod +x tools/script-name.sh
./tools/script-name.sh
```
EOF

# Tutorials structure
cat > tutorials/README.md << 'EOF'
# Tutorials Directory

This directory contains all tutorial content for the sysopsninjas.github.io project.

## Structure:
Organize tutorials by category:
- `/linux/` - Linux administration tutorials
- `/docker/` - Docker and containerization
- `/kubernetes/` - Kubernetes orchestration
- `/monitoring/` - System monitoring and alerting
- `/security/` - Security best practices
- `/automation/` - Automation scripts and tools

## Format:
Each tutorial should include:
- Clear title and description
- Prerequisites
- Step-by-step instructions
- Code examples
- Troubleshooting section
EOF

# Create sample tutorial directories
mkdir -p tutorials/{linux,docker,kubernetes,monitoring,security,automation}

# Create .gitkeep files for empty directories
for dir in tutorials/{linux,docker,kubernetes,monitoring,security,automation}; do
    touch "$dir/.gitkeep"
done

# Create a sample tool script
cat > tools/deploy.sh << 'EOF'
#!/bin/bash

# Deployment script for sysopsninjas.github.io
# This script helps with local development and testing

echo "🔧 SysOps Ninjas Deployment Tool"
echo "================================"

# Check if we're in the right directory
if [ ! -f "index.html" ]; then
    echo "❌ Error: index.html not found. Please run this script from the project root."
    exit 1
fi

# Simple local server for testing
if command -v python3 &> /dev/null; then
    echo "🌐 Starting local server on http://localhost:8000"
    echo "Press Ctrl+C to stop"
    python3 -m http.server 8000
elif command -v python &> /dev/null; then
    echo "🌐 Starting local server on http://localhost:8000"
    echo "Press Ctrl+C to stop"
    python -m SimpleHTTPServer 8000
else
    echo "❌ Python not found. Please install Python to use the local server."
    exit 1
fi
EOF

# Make the deploy script executable
chmod +x tools/deploy.sh

# Create project structure visualization
cat > PROJECT_STRUCTURE.md << 'EOF'
# Project Structure

```
sysopsninjas.github.io/
├── .github/
│   └── workflows/
│       └── deploy.yml          # GitHub Actions workflow
├── assets/
│   ├── css/
│   │   ├── style.css          # Main stylesheet
│   │   └── README.md          # CSS documentation
│   ├── js/
│   │   ├── main.js            # Main JavaScript file
│   │   └── README.md          # JavaScript documentation
│   └── images/                # Images and media
│       └── .gitkeep
├── docs/                      # Documentation
│   └── README.md
├── tools/                     # Utility scripts and tools
│   ├── deploy.sh              # Local development server
│   └── README.md
├── tutorials/                 # Tutorial content
│   ├── linux/
│   ├── docker/
│   ├── kubernetes/
│   ├── monitoring/
│   ├── security/
│   ├── automation/
│   └── README.md
├── index.html                 # Main homepage (existing)
├── sitemap.xml               # SEO sitemap (existing)
├── robots.txt                # Web crawler instructions (existing)
├── README.md                 # Main project README (existing)
└── .gitignore                # Git ignore rules (existing)
```

## Quick Start

1. Run the setup script: `./setup-project-structure.sh`
2. Start local development server: `./tools/deploy.sh`
3. Open http://localhost:8000 in your browser

## Development

- Add CSS styles in `assets/css/`
- Add JavaScript in `assets/js/`
- Create tutorials in `tutorials/`
- Add documentation in `docs/`
- Place utility scripts in `tools/`
EOF

echo ""
echo "✅ Project structure created successfully!"
echo ""
echo "📋 Summary of created files and directories:"
echo "   📁 .github/workflows/ (with deploy.yml)"
echo "   📁 assets/css/ (with style.css)"
echo "   📁 assets/js/ (with main.js)"
echo "   📁 assets/images/"
echo "   📁 docs/"
echo "   📁 tools/ (with deploy.sh)"
echo "   📁 tutorials/ (with category subdirectories)"
echo "   📄 PROJECT_STRUCTURE.md"
echo ""
echo "🚀 Next steps:"
echo "   1. Review the created files and customize them as needed"
echo "   2. Run './tools/deploy.sh' to start a local development server"
echo "   3. Add your content to the appropriate directories"
echo "   4. Commit and push to GitHub to trigger automatic deployment"
echo ""
echo "💡 Pro tip: The deploy.yml workflow will automatically deploy your site"
echo "   to GitHub Pages whenever you push to the main branch!"
echo ""
echo "🎉 Happy coding, SysOps Ninja!"
