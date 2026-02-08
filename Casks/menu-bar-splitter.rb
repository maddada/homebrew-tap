cask "menu-bar-splitter" do
  version "2.0.1"
  sha256 "fae93f11a6ff12b2f17b38d22a80dafa31435b7e8a012c0c77c333e7b2b7f6e3"

  url "https://github.com/maddada/menu-bar-splitter/releases/download/v#{version}/MenuBarSplitter.zip"
  name "Menu Bar Splitter"
  desc "Add dividers to the macOS menu bar to organize icons"
  homepage "https://github.com/maddada/menu-bar-splitter"

  app "Menu Bar Splitter.app"
end
