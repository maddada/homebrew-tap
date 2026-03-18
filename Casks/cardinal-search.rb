cask "cardinal-search" do
  version "0.1.23"
  sha256 "1c496eb6e5aeded495e88d8993718f173a3c6ed9cfa8cc16a13085cc4e7acae0"

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
