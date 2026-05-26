cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.13.0"
  sha256 arm:   "1ba33cefa34c6973793b2f28ae8a41372e0dda7df8d57c90729900cf0ee287e1",
         intel: "229769eb83c2eebeca53db647055f8d25dcc880c768ba17182361eba8ac8aaef"

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
