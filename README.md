# homebrew-tap

Homebrew tap for my macOS apps.

| App | Install | What it is |
| --- | --- | --- |
| [GitSwitch](https://github.com/SouhaibBenFarhat/gitswitch) | `brew install --cask souhaibbenfarhat/tap/gitswitch` | Menu bar app to switch between GitHub CLI accounts — [product page](https://souhaibbenfarhat.github.io/gitswitch) |
| [CodeLobby](https://github.com/SouhaibBenFarhat/code-lobby) | `brew install --cask souhaibbenfarhat/tap/codelobby` | Monitor your GitHub PRs with real-time event streaming |

Apple Silicon (arm64) only. Casks strip the quarantine flag on install, so apps
open cleanly without a "damaged" warning — no extra flags or steps needed.

## Update

```bash
brew upgrade --cask gitswitch
brew upgrade --cask codelobby
```

## Uninstall

```bash
brew uninstall --cask <name>        # remove the app
brew uninstall --zap --cask <name>  # also remove its data
```
