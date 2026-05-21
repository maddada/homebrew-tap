cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.8.0"
  sha256 arm:   "1ee8842f181978c1194757e25f8ae2d9295f90c6d6354df0c894bc7fb9e034b1",
         intel: "0b010e26508c5a9bfba1323078fa0dba1dc602654b850f87af842ffe3e82722a"

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
