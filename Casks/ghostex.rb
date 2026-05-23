cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.11.0"
  sha256 arm:   "c87782a6b99c627e4fd5045fbb5f5b5df378f3e4a1e3c9b65333f8acd4eeaae7",
         intel: "b42f71d9037497d3b699a1322d8a6316fefe643ec471913bf77b81d76040e872"

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
