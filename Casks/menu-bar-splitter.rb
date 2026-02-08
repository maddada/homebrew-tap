cask "menu-bar-splitter" do
  version "2.1"
  sha256 "368dd2c679ce2193c566241ceed7be48ed579e5fc0776312b0a70c9e2fa2b332"

  url "https://github.com/maddada/menu-bar-splitter/releases/download/v#{version}/MenuBarSplitter.zip"
  name "Menu Bar Splitter"
  desc "Add dividers to the macOS menu bar to organize icons"
  homepage "https://github.com/maddada/menu-bar-splitter"

  app "Menu Bar Splitter.app"
end
