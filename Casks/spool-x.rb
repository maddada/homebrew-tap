cask "spool-x" do
  version "0.2.1"
  sha256 "10ae700f2da43f0a7dd7841326be753a1b00d20be87ed476976a6f2eeaf41a5e"

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
