# Setup Instructions for homebrew-masuk Repository

This directory contains everything needed for the Homebrew tap.

## Initial Setup

### 1. Create GitHub Repository

Go to: https://github.com/new

- Repository name: `homebrew-masuk` (must start with `homebrew-`)
- Description: `Homebrew tap for masuk - SSH host and port manager`
- Public repository
- Don't initialize with README (we already have one)

### 2. Initialize Git and Push

```bash
cd homebrew
git init
git add .
git commit -m "Initial commit - masuk formula"
git branch -M main
git remote add origin https://github.com/herpiko/homebrew-masuk.git
git push -u origin main
```

### 3. Create a Release Tag in Main Repository

Before publishing the formula, you need to create a release:

```bash
# In the main masuk repository (parent directory)
cd ..
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

### 4. Create GitHub Release

1. Go to: https://github.com/herpiko/masuk/releases/new
2. Select tag: `v0.1.0`
3. Release title: `v0.1.0`
4. Add release notes describing changes
5. Click "Publish release"

### 5. Calculate SHA256 Checksum

```bash
curl -sL https://github.com/herpiko/masuk/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
```

Copy the output (the SHA256 hash).

### 6. Update Formula with SHA256

```bash
cd homebrew
nano Formula/masuk.rb
```

Replace `REPLACE_WITH_SHA256_CHECKSUM` with the hash from step 5.

Example:
```ruby
sha256 "abc123def456..."
```

### 7. Commit and Push the Update

```bash
git add Formula/masuk.rb
git commit -m "Update SHA256 checksum for v0.1.0"
git push
```

## Testing Locally (Before Publishing)

```bash
# Install from local formula
brew install --build-from-source Formula/masuk.rb

# Test it works
masuk --help
masuk add test -h example.com
masuk ls
masuk rm test

# Test the formula
brew test masuk

# Audit the formula
brew audit --strict Formula/masuk.rb

# Uninstall
brew uninstall masuk
```

## Publishing (Making it Available to Users)

Once pushed to GitHub, users can install with:

```bash
brew install herpiko/masuk/masuk
```

Or:

```bash
brew tap herpiko/masuk
brew install masuk
```

## Updating for New Releases

When you release a new version (e.g., v0.2.0):

### 1. Tag and Release

```bash
# In main masuk repository
git tag -a v0.2.0 -m "Release v0.2.0"
git push origin v0.2.0
```

Create GitHub release as before.

### 2. Calculate New SHA256

```bash
curl -sL https://github.com/herpiko/masuk/archive/refs/tags/v0.2.0.tar.gz | shasum -a 256
```

### 3. Update Formula

```bash
cd homebrew
nano Formula/masuk.rb
```

Update:
```ruby
url "https://github.com/herpiko/masuk/archive/refs/tags/v0.2.0.tar.gz"
sha256 "NEW_SHA256_HERE"
```

### 4. Push Update

```bash
git add Formula/masuk.rb
git commit -m "masuk 0.2.0"
git push
```

### 5. Users Update

```bash
brew update
brew upgrade masuk
```

## Troubleshooting

### Formula Syntax Check

```bash
brew audit --strict Formula/masuk.rb
```

### Test Build

```bash
brew install --build-from-source --verbose Formula/masuk.rb
```

### View Build Logs

```bash
brew install --verbose masuk
```

## CI/CD

The `.github/workflows/test.yml` file automatically tests the formula on every push to ensure it works correctly.

## Files in This Directory

```
homebrew/
├── Formula/
│   └── masuk.rb          # Homebrew formula
├── .github/
│   └── workflows/
│       └── test.yml      # CI testing
├── README.md             # Tap documentation
└── SETUP.md              # This file
```

## Quick Reference Commands

```bash
# Install
brew install herpiko/masuk/masuk

# Upgrade
brew upgrade masuk

# Uninstall
brew uninstall masuk

# Tap info
brew tap-info herpiko/masuk

# Formula info
brew info masuk
```

## Support

For issues with:
- Formula: https://github.com/herpiko/homebrew-masuk/issues
- Masuk itself: https://github.com/herpiko/masuk/issues
