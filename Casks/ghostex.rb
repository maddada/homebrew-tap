cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.4.1"
  sha256 arm:   "3458caed45bb6f6442ab3c328531eb2b8072387fc577a1bfe74917042a073345",
         intel: "037d97ce3168e4ec9ac8408c97eedb1479ac7064dc304eb2aa09ae3e201bd220"

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
