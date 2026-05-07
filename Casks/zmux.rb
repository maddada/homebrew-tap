cask "zmux" do
  version "1.4.9"
  sha256 "d5c407008e680ad0f187c71ab7f16a19b912b06c3812ac32d6f4f5cc54cbc882"

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
