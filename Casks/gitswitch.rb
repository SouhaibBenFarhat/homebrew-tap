cask "gitswitch" do
  version "0.1.1"
  sha256 "0e0c3d4e97c718c3f42857ebed8925deb57245ff291250ef0acdaeb92ac03880"

  url "https://github.com/SouhaibBenFarhat/gitswitch/releases/download/v#{version}/GitSwitch-arm64.zip",
      verified: "github.com/SouhaibBenFarhat/gitswitch/"
  name "GitSwitch"
  desc "Menu bar app to switch between GitHub CLI accounts"
  homepage "https://github.com/SouhaibBenFarhat/gitswitch"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"
  depends_on formula: "gh"

  app "GitSwitch.app"

  # GitSwitch is ad-hoc signed (not notarized), so a freshly downloaded app
  # would be flagged "damaged". Strip the quarantine attribute on install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/GitSwitch.app"]
  end

  uninstall quit: "com.souhaibbenfarhat.gitswitch"

  zap trash: [
    "~/Library/Caches/GitSwitch",
  ]
end
