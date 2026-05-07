cask "zmux" do
  version "1.4.10"
  sha256 "c6fd3dac8eb2dc9d785d01c394e1fcdcc116d4d8dd4382780ebc5a60142a2b54"

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
