cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.9.0"
  sha256 arm:   "13f5423c9de354bc93d6ae2c865d2d2b25e86c843558b54e90ee3978c192bdac",
         intel: "ddf69a3157d3b8b1e6ebd1f71a79ae614755b008816d3240be19f199779b2d57"

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
