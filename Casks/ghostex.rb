cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.7.0"
  sha256 arm:   "74a0c794994cb56b692d06a4cf4e85f0106d89d34ccc6426488f5f5b96ffed32",
         intel: "90fd5fcc799f50efabd6d1f273ff41fde71a925fa159b0377368036c5d4e453a"

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
