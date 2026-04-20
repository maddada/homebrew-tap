cask "madda-floating-clock" do
  version "1.0"
  sha256 "5adf0421c67d3d465d15154941378c2f7c9b1f6845fac066c2462b03c27f220d"

  url "https://github.com/maddada/MaddaFloatingClock/releases/download/v#{version}/MaddaFloatingClock.zip"
  name "Madda Floating Clock"
  desc "Customizable floating clock for macOS"
  homepage "https://github.com/maddada/MaddaFloatingClock"

  app "Madda Floating Clock.app"

  zap trash: [
    "~/Library/Application Support/MaddaFloatingClock",
    "~/Library/Preferences/com.madda.floatingclock.plist",
    "~/Library/Saved Application State/com.madda.floatingclock.savedState",
  ]
end
