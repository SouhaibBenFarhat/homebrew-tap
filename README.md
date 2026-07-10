# homebrew-tap

Homebrew tap for [CodeLobby](https://github.com/SouhaibBenFarhat/code-lobby) — a desktop app to monitor your GitHub PRs with real-time event streaming.

## Install

```bash
brew install --cask --no-quarantine souhaibbenfarhat/tap/codelobby
```

> **Why `--no-quarantine`?** CodeLobby is not (yet) notarized by Apple. The flag tells Homebrew to skip macOS's quarantine flag so the app opens without the "CodeLobby is damaged and can't be opened" warning. It's Apple Silicon (arm64) only.

## Update

```bash
brew upgrade --cask codelobby
```

## Uninstall

```bash
brew uninstall --cask codelobby        # remove the app
brew uninstall --zap --cask codelobby  # also remove its data (~/Library, ~/.codelobby)
```
