cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.9.1"
  sha256 arm:   "f551f0bbe68ea479d57e726515510707d4757470933b09cdc512e3b06d85e599",
         intel: "13581e31c7020c91c22f891293e2776db76a7889d7bf9b517b1cb2404aeca3ee"

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
