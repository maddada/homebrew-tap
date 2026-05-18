cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.5.0"
  sha256 arm:   "248c5f885cde4894e312c267dd053e6d64d0e3b7bd6bf192ccbd6fbddedd7684",
         intel: "41c45405e3a8c280bf4ae60c2195a56df0b33ce47393f12ff991f33cd0dc7686"

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
