cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "2.7.0"
  sha256 arm:   "0c85232af064f8696c47cfe7be264010667831ee6471465d36534f20fc689553",
         intel: "fd6a139ea0c98de6570500ed5a7f67071242c69058659ea72dce59b9c1a7f563"

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
