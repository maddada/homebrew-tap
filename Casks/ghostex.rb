cask "ghostex" do
  version "2.5.0"
  sha256 "ebbf925a8765990b5f6b18b466a6f7e824dfc88b1dbb9046fbbd72d97a7d1c06"

  url "https://github.com/maddada/Ghostex/releases/download/v2.5/ghostex-#{version}-arm64.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Ghostex.app"

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
