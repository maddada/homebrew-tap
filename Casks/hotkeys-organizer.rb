cask "hotkeys-organizer" do
  version "1.0.0"
  sha256 "1c402cc9085595c5f25d8fcf617f031cfcf923ca9647b89c8780fa3edd5d8703"

  url "https://github.com/maddada/hotkeys-organizer-swift/releases/download/v#{version}/HotkeysOrganizer_#{version}.dmg"
  name "Hotkeys Organizer"
  desc "macOS menu bar app for organizing and quick-accessing keyboard shortcuts"
  homepage "https://github.com/maddada/hotkeys-organizer-swift"

  depends_on macos: ">= :sonoma"

  app "HotkeysOrganizer.app"

  zap trash: [
    "~/Library/Preferences/dev.madda.HotkeysOrganizer.plist",
    "~/Library/Saved Application State/dev.madda.HotkeysOrganizer.savedState",
  ]
end
