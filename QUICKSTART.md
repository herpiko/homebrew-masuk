# Quick Start - Publishing to Homebrew

Everything you need is in this directory. Just follow these steps:

## Prerequisites

✅ GitHub account
✅ Code is ready and tested
✅ `masuk` works locally

## Step-by-Step

### 1. Create a Release Tag (in main repository)

```bash
cd ..  # Go back to main masuk directory
git tag -a v0.1.0 -m "Release v0.1.0"
git push origin v0.1.0
```

### 2. Create GitHub Release

Go to: https://github.com/herpiko/masuk/releases/new
- Select tag: `v0.1.0`
- Title: `v0.1.0`
- Add release notes
- Click "Publish release"

### 3. Calculate SHA256

```bash
curl -sL https://github.com/herpiko/masuk/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256
```

Copy the hash (first part of output).

### 4. Update Formula

```bash
cd homebrew  # This directory
nano Formula/masuk.rb
```

Replace `REPLACE_WITH_SHA256_CHECKSUM` with your hash:

```ruby
sha256 "abc123def456..."  # Your actual hash here
```

Save and exit.

### 5. Create GitHub Repository

Go to: https://github.com/new
- Repository name: **`homebrew-masuk`** (must start with `homebrew-`)
- Description: `Homebrew tap for masuk`
- Public
- Click "Create repository"

### 6. Push This Directory

```bash
# Still in homebrew directory
./publish.sh
```

Or manually:

```bash
git init
git add .
git commit -m "Initial commit - masuk formula"
git branch -M main
git remote add origin https://github.com/herpiko/homebrew-masuk.git
git push -u origin main
```

## Done! 🎉

Users can now install with:

```bash
brew install herpiko/masuk/masuk
```

## Testing Before Publishing

Test the formula locally:

```bash
brew install --build-from-source Formula/masuk.rb
masuk --help
brew test masuk
brew uninstall masuk
```

## Future Updates

When you release v0.2.0:

1. Tag: `git tag v0.2.0 && git push origin v0.2.0`
2. Create GitHub release
3. Calculate new SHA256
4. Update `Formula/masuk.rb`:
   - Change URL to `v0.2.0`
   - Update SHA256
5. Commit and push:
   ```bash
   git add Formula/masuk.rb
   git commit -m "masuk 0.2.0"
   git push
   ```

Users update with: `brew upgrade masuk`

## Troubleshooting

**Formula syntax error?**
```bash
brew audit --strict Formula/masuk.rb
```

**Build fails?**
```bash
brew install --verbose --build-from-source Formula/masuk.rb
```

**Can't find tap?**
```bash
brew tap herpiko/masuk
brew tap  # Should show herpiko/masuk in the list
```

## Files in This Directory

```
homebrew/
├── Formula/
│   └── masuk.rb              # The Homebrew formula
├── .github/workflows/
│   └── test.yml              # CI testing (optional)
├── README.md                 # Tap documentation
├── SETUP.md                  # Detailed setup guide
├── QUICKSTART.md             # This file
├── publish.sh                # Automated publish script
├── LICENSE                   # MIT license
└── .gitignore                # Git ignore file
```

## Get Help

- Homebrew docs: https://docs.brew.sh/Formula-Cookbook
- This tap issues: https://github.com/herpiko/homebrew-masuk/issues
- Masuk issues: https://github.com/herpiko/masuk/issues

---

**Pro Tip:** Use `./publish.sh` - it checks everything and guides you through the process!
