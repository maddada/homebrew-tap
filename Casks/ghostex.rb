cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "2.5.1"
  sha256 arm:   "17f911e10f85d164a6b3009a1a7e877e3d474ffe9be09e48ab1b67f1cbc299be",
         intel: "47c42aaa63d12e539aecdfe0249e794ba0460606e6f211822127fd9d0297091b"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-#{arch}.dmg"
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
