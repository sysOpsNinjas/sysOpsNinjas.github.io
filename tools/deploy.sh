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
