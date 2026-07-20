cask "easycopy" do
  version "0.1.0"
  sha256 "15c9c9f381dbbdea74c23e8d0748d9392acb22123aa98a64e711bf6e616bf800"

  url "https://github.com/SouhaibBenFarhat/easy-copy/releases/download/v#{version}/EasyCopy-arm64.zip",
      verified: "github.com/SouhaibBenFarhat/easy-copy/"
  name "EasyCopy"
  desc "Menu bar app to copy saved snippets to the clipboard with one click"
  homepage "https://github.com/SouhaibBenFarhat/easy-copy"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "EasyCopy.app"

  # EasyCopy is ad-hoc signed (not notarized), so a freshly downloaded app
  # would be flagged "damaged". Strip the quarantine attribute on install.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/EasyCopy.app"]
  end

  uninstall quit: "com.souhaibbenfarhat.easycopy"

  zap trash: [
    "~/Library/Application Support/EasyCopy",
  ]
end
