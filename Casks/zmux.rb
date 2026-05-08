cask "zmux" do
  version "2.1.0"
  sha256 "6bbd2a95f1f585df20a2811c8f2cae492ad53492bc13814b4b085c5a906e9ced"

  url "https://github.com/maddada/zmux/releases/download/v2.1/zmux-#{version}.dmg"
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
