cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.8.0"
  sha256 arm:   "8de9d612a7b0e58ac96ee2a5d91c0a436dda3735e92899e1fd15249357ef4df2",
         intel: "de8193ba05f0916a194f032dc4c8005dfdaff0ade9dbe17373dc089a4a1dd521"

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
