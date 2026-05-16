cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.2.0"
  sha256 arm:   "33793f3de5166a5c1c5f95373cb9d209b890699be94c55f9ab278dcaaadee51d",
         intel: "818fe72daf05814f7f61e300ed4bfccccbdbd6b6277b8986f236fdba75b04158"

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
