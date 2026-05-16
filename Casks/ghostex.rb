cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.4.0"
  sha256 arm:   "6ae4966514d685941230fa15d0c8174837ac5b4d204529c0c5f23a62efa9fdd8",
         intel: "271f0ab012414703787346caee4580511fe2fd6d0839e6f8f8975f2117e73d2a"

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
