cask "stats" do
  version "3.0.0"
  sha256 "c94c906c45f79465a8d46bdae05ab9d4573d322b43ffac8067ff1700bda1f63b"

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
