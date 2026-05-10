cask "zmux" do
  version "2.3.0"
  sha256 "aabfea87f042ab59e1eb8aabd371226108df5a980edccbee80f58b26d7a80d70"

  url "https://github.com/maddada/zmux/releases/download/v2.3/zmux-#{version}.dmg"
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
