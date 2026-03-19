cask "cardinal-search" do
  version "0.1.24"
  sha256 "79731deb4973f5eb53481c5383993bbc4115f43faa910169f1dea770ce89ea90"

  url "https://github.com/maddada/cardinal/releases/download/v#{version}/Cardinal_#{version}_universal.dmg"
  name "Cardinal"
  desc "Fast file search app for macOS"
  homepage "https://github.com/maddada/cardinal"

  depends_on macos: ">= :monterey"

  app "Cardinal.app"

  zap trash: [
    "~/Library/Preferences/com.madda.cardinal.plist",
    "~/Library/Saved Application State/com.madda.cardinal.savedState",
  ]
end
