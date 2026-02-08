cask "menu-bar-splitter" do
  version "2.0.1"
  sha256 "7adb54e30c0d5d6feb18b146cd331e9e08740d71d8e7c223207f2b3d2955f151"

  url "https://github.com/maddada/menu-bar-splitter/releases/download/v#{version}/MenuBarSplitter.zip"
  name "Menu Bar Splitter"
  desc "Add dividers to the macOS menu bar to organize icons"
  homepage "https://github.com/maddada/menu-bar-splitter"

  app "Menu Bar Splitter.app"
end
