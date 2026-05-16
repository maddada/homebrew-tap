cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.3.0"
  sha256 arm:   "95320f2d347aadecbfd7519e39eaa2865622818e79aa846300c740c8a309cc87",
         intel: "0a36916cd3fb40d88d3af765b5f5a44ac59c4e2ae811f9fbe150c70c24e39cfe"

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
