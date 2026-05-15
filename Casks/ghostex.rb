cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.0.0"
  sha256 arm:   "94fac816834529fd04f7a6e76ee972e25c2e15ae3c484e3fdc787692d92ec9af",
         intel: "818cf52353e7d73ddf5ed74b4ecb2c0d6396f31379a2b024ba36d1f85d069f12"

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
