cask "stats" do
  version "3.1.0"
  sha256 "05c5146398758dbf5bc28fff7d84c9c833a7b2801e3c275fc27b9f6f5ec8a036"

  url "https://github.com/maddada/stats/releases/download/v#{version}/Stats.dmg"
  name "Stats"
  desc "macOS system monitor in your menu bar"
  homepage "https://github.com/maddada/stats"

  depends_on macos: ">= :big_sur"

  app "Stats.app"

  zap trash: [
    "~/Library/Preferences/com.madda.Stats.plist",
    "~/Library/Saved Application State/com.madda.Stats.savedState",
  ]
end
