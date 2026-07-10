# homebrew-tap

Homebrew tap for [CodeLobby](https://github.com/SouhaibBenFarhat/code-lobby) — a desktop app to monitor your GitHub PRs with real-time event streaming.

## Install

```bash
brew install --cask souhaibbenfarhat/tap/codelobby
```

Apple Silicon (arm64) only. The cask opens the app without any "damaged" warning — no extra flags or steps needed.

## Update

```bash
brew upgrade --cask codelobby
```

## Uninstall

```bash
brew uninstall --cask codelobby        # remove the app
brew uninstall --zap --cask codelobby  # also remove its data (~/Library, ~/.codelobby)
```
