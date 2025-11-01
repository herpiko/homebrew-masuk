# 👋 Start Here!

Welcome to the Homebrew tap directory for masuk. Everything you need is here.

## 🚀 Super Quick Start (5 Steps)

```bash
# 1. Tag your release (in parent directory)
cd ..
git tag v0.1.0 && git push origin v0.1.0

# 2. Calculate SHA256
curl -sL https://github.com/herpiko/masuk/archive/refs/tags/v0.1.0.tar.gz | shasum -a 256

# 3. Update Formula (replace REPLACE_WITH_SHA256_CHECKSUM)
cd homebrew
nano Formula/masuk.rb

# 4. Create GitHub repo 'homebrew-masuk' at:
# https://github.com/new

# 5. Publish
./publish.sh
```

Done! Users can now: `brew install herpiko/masuk/masuk`

## 📚 Documentation

- **QUICKSTART.md** - Fast track guide (START HERE)
- **SETUP.md** - Detailed step-by-step
- **README.md** - User-facing documentation

## 🧪 Test Before Publishing

```bash
brew install --build-from-source Formula/masuk.rb
masuk --help
brew test masuk
```

## 🆘 Need Help?

Read **QUICKSTART.md** - it has everything explained!

## 📋 Checklist

Before running `./publish.sh`:

- [ ] Created git tag v0.1.0 in main repo
- [ ] Created GitHub release
- [ ] Calculated SHA256 checksum
- [ ] Updated Formula/masuk.rb with SHA256
- [ ] Created GitHub repo: homebrew-masuk

If yes to all ✅ Run: `./publish.sh`

---

**The `publish.sh` script will guide you through the rest!**
