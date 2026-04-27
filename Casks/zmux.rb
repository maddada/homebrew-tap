cask "zmux" do
  version "1.0.0"
  sha256 "983dc4097019d3e0ddc394420f6f659963280c4f814cb5e601a25fc7f20dfb9d"

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
