cask "codelobby" do
  version "0.2.1"
  sha256 "ae93c8259a77bbb9ff5a015831ab39cabffcfe3e23668d8f5b6b19f45fe44bd9"

  url "https://github.com/SouhaibBenFarhat/code-lobby/releases/download/v#{version}/CodeLobby-arm64.dmg",
      verified: "github.com/SouhaibBenFarhat/code-lobby/"
  name "CodeLobby"
  desc "Monitor your GitHub PRs with real-time event streaming"
  homepage "https://github.com/SouhaibBenFarhat/code-lobby"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64

  app "CodeLobby.app"

  # CodeLobby isn't notarized yet, so a freshly downloaded app would be flagged
  # "damaged". Strip the quarantine attribute on install so it opens cleanly.
  # (Replaces the old `--no-quarantine` flag, which recent Homebrew removed.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodeLobby.app"]
  end

  zap trash: [
    "~/Library/Application Support/codelobby",
    "~/Library/Preferences/com.codelobby.app.plist",
    "~/Library/Saved Application State/com.codelobby.app.savedState",
    "~/.codelobby"
  ]
end
