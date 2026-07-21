cask "easyapply" do
  version "0.1.0"
  sha256 "1e3838f0eb5956ddf02b945f4bf32b5959574947973fb22b3d709450e89534d8"

  url "https://github.com/SouhaibBenFarhat/easy-apply/releases/download/v#{version}/EasyApply-arm64.dmg",
      verified: "github.com/SouhaibBenFarhat/easy-apply/"
  name "EasyApply"
  desc "Job postings aggregator for Munich and remote Europe"
  homepage "https://souhaibbenfarhat.github.io/easy-apply/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "EasyApply.app"

  # The app is ad-hoc signed, not notarized — without this Gatekeeper flags it
  # as "damaged".
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/EasyApply.app"]
  end

  uninstall quit: "com.souhaibbenfarhat.easyapply"

  zap trash: [
    "~/Library/Application Support/EasyApply",
    "~/Library/Preferences/com.souhaibbenfarhat.easyapply.plist",
    "~/Library/Saved Application State/com.souhaibbenfarhat.easyapply.savedState",
  ]
end
