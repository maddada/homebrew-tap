cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "2.5.0"
  sha256 arm:   "ebbf925a8765990b5f6b18b466a6f7e824dfc88b1dbb9046fbbd72d97a7d1c06",
         intel: "0625820cc69c570f077b0490a1e265876f6a35580d6348703d57e329f1b46f1c"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version.major_minor}/ghostex-#{version}-#{arch}.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  depends_on macos: :ventura

  app "Ghostex.app"

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
