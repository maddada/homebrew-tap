cask "zmux" do
  version "2.2.0"
  sha256 "73340ec06d57c3b16a585ee9c5566513c91fd5e0a6cba9477ae5982a122521c9"

  url "https://github.com/maddada/zmux/releases/download/v2.2/zmux-#{version}.dmg"
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
