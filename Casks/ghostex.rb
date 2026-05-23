cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.12.0"
  sha256 arm:   "9a551bf2e417a2a8301f81f1f22c34f7375ec14ec87d7f9540eaa9d7af6201a8",
         intel: "51d6c584bca3bcd43dac16e6d5c4713b2948b2adbbdca7b4c1715e77ab3b01cc"

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
