cask "cardinal-search" do
  version "0.1.24"
  sha256 "e8be73525bd7fb8e3b3ab21daeec597093de64bae399779cb346a8d28b31efd8"

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
