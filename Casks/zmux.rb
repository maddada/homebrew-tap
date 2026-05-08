cask "zmux" do
  version "1.4.11"
  sha256 "44c8431280ed83907174f9192ae2623250af9da3c71b60a064de337782fa3462"

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
