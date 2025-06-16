#!/bin/bash

# Project initialization script
# Creates basic project structure with directories and files

set -e  # Exit on any error

read -p "📁 Enter project name [my-project]: " PROJECT_NAME
PROJECT_NAME=${PROJECT_NAME:-"my-project"}

read -p "👤 Enter author name [Your Name]: " AUTHOR_NAME
AUTHOR_NAME=${AUTHOR_NAME:-"Your Name"}

read -p "📧 Enter author email [your.email@example.com]: " AUTHOR_EMAIL
AUTHOR_EMAIL=${AUTHOR_EMAIL:-"your.email@example.com"}

echo
echo "🚀 Initializing project: $PROJECT_NAME"
echo "📧 Author: $AUTHOR_NAME <$AUTHOR_EMAIL>"

# Create main project directory
echo
if [ -d "$PROJECT_NAME" ]; then
    echo "⚠️  Directory '$PROJECT_NAME' already exists!"
    exit 1
else
    echo "📁 Creating project directory: $PROJECT_NAME"
    mkdir "$PROJECT_NAME"
fi

cd "$PROJECT_NAME"

# Create directory structure
echo "📁 Creating directory structure..."
mkdir -p src tests

# Create LICENSE file
echo "📄 Creating LICENSE file..."
cat > LICENSE << EOF
MIT License

Copyright (c) $(date +%Y) $AUTHOR_NAME

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

# Create README.md
echo "📖 Creating README.md..."
cat > README.md << EOF
# $PROJECT_NAME

## Description
Brief description of your project.

## Installation
\`\`\`bash
# Installation instructions
\`\`\`

## Usage
\`\`\`bash
# Usage examples
\`\`\`

## Contributing
Description of project contribution guidelines.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author
$AUTHOR_NAME
EOF

# Create .gitignore
echo "🚫 Creating .gitignore..."
cat > .gitignore << EOF
# You can use this .gitignore file or any other.

# Dependencies
node_modules/
vendor/

# Build outputs
dist/
build/
*.o
*.so
*.dylib
*.exe

# Environment files
.env
.env.local
.env.*.local

# IDE files
.vscode/
.idea/
*.swp
*.swo
*~

# Logs
*.log
logs/
EOF

# Create basic source file
echo "💻 Creating basic source files..."
cat > src/main.py << EOF
def main():
    """Main function"""
    print("Hello, $PROJECT_NAME!")

if __name__ == "__main__":
    main()
EOF

# Create basic test file
echo "🧪 Creating test files..."
touch tests/test_main.py

# Create requirements.txt
echo "📦 Creating requirements.txt..."
cat > requirements.txt << EOF
# Add your project dependencies here
# Example:
# requests>=2.25.1
# numpy>=1.21.0
EOF

# Create Makefile
echo "🔧 Creating Makefile..."
cat > Makefile << EOF
.PHONY: help install test clean run

help:
	@echo "Available commands:"
	@echo "  install  - Install dependencies"
	@echo "  run      - Run the application"
	@echo "  test     - Run tests"

install:
	pip3 install -r requirements.txt

run:
	python3 src/main.py

test:
	pytest tests/ -v
EOF

echo "✅ Project initialization complete!"
echo ""
echo "📁 Created directories:"
echo "  - src/     (source code)"
echo "  - tests/    (test files)"
echo ""
echo "📄 Created files:"
echo "  - LICENSE"
echo "  - README.md"
echo "  - .gitignore"
echo "  - requirements.txt"
echo "  - Makefile"
echo "  - src/main.py"
echo "  - tests/test_main.py"
echo ""
echo "🎉 Your project '$PROJECT_NAME' is ready to go!"
echo "💡 Usage:
        chmod +x ./template.sh && ./template.sh
    or
        bash template.sh"
echo "🚀 Happy coding!"