cask "zmux" do
  version "2.3.2"
  sha256 "61d2d71547b492eb732483d09193df3cb3de2b475f86f7916f75344d89daf220"

  url "https://github.com/maddada/zmux/releases/download/v2.3.2/zmux-#{version}.dmg"
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
