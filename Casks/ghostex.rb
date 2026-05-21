cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.6.0"
  sha256 arm:   "b6ca15a902d4576a3f78e3f8838947a04d1ee22842899f526df82c6036270285",
         intel: "95f2cebef66c7329a25b2bfb3df97ab79f0ccd4d4471efef934ee2f86eb8975f"

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
