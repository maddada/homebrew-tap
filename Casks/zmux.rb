cask "zmux" do
  version "1.4.5"
  sha256 "ff85274e1f4f8f5a1883c804f455ee36a160214feffc5fd0ed1ea5060ce65395"

  url "https://github.com/maddada/zmux/releases/download/v#{version}/zmux-#{version}.dmg"
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
