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
