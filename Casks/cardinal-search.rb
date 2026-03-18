cask "cardinal-search" do
  version "0.1.23"
  sha256 "8b62038809d7d69bcb8986d289eda2119261945ede253d14d015c719aec03fd5"

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
