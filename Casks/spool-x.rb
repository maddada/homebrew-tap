cask "spool-x" do
  version "0.2.2"
  sha256 "6a879fdbb1e6668e2deb69341d0db5283f6d54a01e26bed9cba66827d5024e5b"

  url "https://github.com/maddada/spool/releases/download/v#{version}/Spool-#{version}-arm64.dmg"
  name "Spool"
  desc "A local search engine for your thinking"
  homepage "https://github.com/maddada/spool"

  depends_on macos: ">= :monterey"

  app "Spool.app"

  zap trash: [
    "~/Library/Preferences/com.madda.spoolx.plist",
    "~/Library/Saved Application State/com.madda.spoolx.savedState",
  ]
end
