# Homebrew Tap for Masuk

Official Homebrew tap for [Masuk](https://github.com/herpiko/masuk) - an SSH host and port manager.

## What is Masuk?

Masuk is a simple SSH host and port manager that allows you to save SSH connection details with memorable names and connect quickly.

Features:
- Save SSH hosts with custom names
- Store optional user and port configurations
- Quick connect with profile names
- Simple JSON-based configuration
- No modification to `~/.ssh/config`

## Installation

### Quick Install

```bash
brew install herpiko/masuk/masuk
```

### Or tap first, then install

```bash
brew tap herpiko/masuk
brew install masuk
```

## Usage

```bash
# Add a profile
masuk add myserver -h example.com -u deploy -p 2222

# Connect to a saved profile
masuk myserver

# List all profiles
masuk ls

# Remove a profile
masuk rm myserver
```

## Examples

```bash
# Simple host
masuk add prod -h production.example.com

# With custom user
masuk add staging -h staging.example.com -u admin

# With custom port
masuk add dev -h 192.168.1.100 -p 2222

# With both user and port
masuk add server -h server.com -u root -p 22000

# Connect
masuk prod  # Connects to production.example.com
```

## Updating

```bash
brew update
brew upgrade masuk
```

## Uninstalling

```bash
brew uninstall masuk
```

## Documentation

For more information, see the [main repository](https://github.com/herpiko/masuk).

## Issues

If you encounter any issues:
- Formula issues: [Report here](https://github.com/herpiko/homebrew-masuk/issues)
- Masuk issues: [Report here](https://github.com/herpiko/masuk/issues)

## License

MIT
