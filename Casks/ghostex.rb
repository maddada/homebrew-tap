cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "2.6.0"
  sha256 arm:   "a99749d0ce501a716c9d89101d627c718a8a8becb746fa26abb3f5525a3a3df8",
         intel: "7169c9ef1ca78e7212c539859fd3a1160659e911a9b56c0f4cccfe18f089db5a"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-#{arch}.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  depends_on macos: :ventura

  app "Ghostex.app"

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
