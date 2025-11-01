#!/bin/bash
# Quick publish script for homebrew-masuk

set -e

echo "========================================"
echo "  Homebrew Tap Publisher"
echo "========================================"
echo ""

# Check if we're in the homebrew directory
if [ ! -f "Formula/masuk.rb" ]; then
    echo "Error: Must be run from homebrew directory"
    exit 1
fi

# Check if formula has SHA256
if grep -q "REPLACE_WITH_SHA256_CHECKSUM" Formula/masuk.rb; then
    echo "⚠️  Warning: SHA256 checksum not set yet!"
    echo ""
    echo "Please follow these steps:"
    echo ""
    echo "1. Tag and push the release in main repository:"
    echo "   cd .."
    echo "   git tag -a v0.1.0 -m 'Release v0.1.0'"
    echo "   git push origin v0.1.0"
    echo ""
    echo "2. Create GitHub release at:"
    echo "   https://github.com/herpiko/masuk/releases/new"
    echo ""
    echo "3. Calculate SHA256:"
    echo "   curl -sL https://github.com/herpiko/masuk/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256"
    echo ""
    echo "4. Update Formula/masuk.rb with the SHA256"
    echo ""
    echo "5. Run this script again"
    exit 1
fi

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "Initializing git repository..."
    git init
    git add .
    git commit -m "Initial commit - masuk formula"
    git branch -M main

    echo ""
    echo "✓ Git initialized"
    echo ""
    echo "Next steps:"
    echo "1. Create GitHub repository: homebrew-masuk"
    echo "   https://github.com/new"
    echo ""
    echo "2. Add remote and push:"
    echo "   git remote add origin https://github.com/herpiko/homebrew-masuk.git"
    echo "   git push -u origin main"
    echo ""
    echo "3. Users can then install with:"
    echo "   brew install herpiko/masuk/masuk"
    exit 0
fi

# Check if remote exists
if ! git remote | grep -q "origin"; then
    echo "Adding git remote..."
    read -p "Confirm GitHub repository is created at herpiko/homebrew-masuk? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Please create the repository first at:"
        echo "https://github.com/new"
        echo "Repository name: homebrew-masuk"
        exit 1
    fi

    git remote add origin https://github.com/herpiko/homebrew-masuk.git
fi

# Push to GitHub
echo ""
echo "Pushing to GitHub..."
git add .
if git diff --cached --quiet; then
    echo "No changes to commit"
else
    read -p "Enter commit message: " commit_msg
    if [ -z "$commit_msg" ]; then
        commit_msg="Update formula"
    fi
    git commit -m "$commit_msg"
fi

git push -u origin main

echo ""
echo "✅ Published successfully!"
echo ""
echo "Users can now install with:"
echo "  brew install herpiko/masuk/masuk"
echo ""
echo "Or:"
echo "  brew tap herpiko/masuk"
echo "  brew install masuk"
echo ""
echo "========================================"
