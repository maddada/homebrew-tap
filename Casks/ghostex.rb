cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.1.0"
  sha256 arm:   "9d3c2590cb44441673a3276fb5a1f99a389e7b197c7b874ddfea4937de1bc2eb",
         intel: "af9ec942314eabbb31e9569511ecc2a04c12f1fa29a3b3cdaa7fb4b0127cb8b4"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-#{arch}.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  depends_on macos: :ventura

  app "ghostex.app"
  binary "#{appdir}/ghostex.app/Contents/Resources/Web/cli/ghostex"
  binary "#{appdir}/ghostex.app/Contents/Resources/Web/cli/gtx"

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
