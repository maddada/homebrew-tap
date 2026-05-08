cask "zmux" do
  version "2.0.0"
  sha256 "da519a720e65a955ce182f0655ba36a6cb02c188aab441142dc2bf9747f70456"

  url "https://github.com/maddada/zmux/releases/download/v2.0/zmux-#{version}.dmg"
  name "zmux"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/zmux"

  depends_on macos: ">= :ventura"

  app "zmux.app"

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
