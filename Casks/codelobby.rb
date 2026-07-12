cask "codelobby" do
  version "0.2.6"
  sha256 "ac984a713d74b7e8f94e0e44a3153afde5a1845fa1fd66422aa2167afeaa5ba0"

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
  depends_on :macos

  app "CodeLobby.app"

  # CodeLobby isn't notarized yet, so a freshly downloaded app would be flagged
  # "damaged". Strip the quarantine attribute on install so it opens cleanly.
  # (Replaces the old `--no-quarantine` flag, which recent Homebrew removed.)
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/CodeLobby.app"]
  end

  zap trash: [
    "~/.codelobby",
    "~/Library/Application Support/codelobby",
    "~/Library/Preferences/com.codelobby.app.plist",
    "~/Library/Saved Application State/com.codelobby.app.savedState",
  ]
end
