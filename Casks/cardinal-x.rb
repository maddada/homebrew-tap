cask "cardinal-x" do
  version "0.1.25"
  sha256 "118ecedc49597e7f7232f47ab91415489b516e163274c3298f2dae3afafc9791"

  url "https://github.com/maddada/cardinal/releases/download/v#{version}/Cardinal.X_#{version}_universal.dmg"
  name "Cardinal X"
  desc "Fast file search app for macOS"
  homepage "https://github.com/maddada/cardinal"

  depends_on macos: ">= :monterey"

  app "Cardinal X.app"

  zap trash: [
    "~/Library/Preferences/com.madda.cardinalx.plist",
    "~/Library/Saved Application State/com.madda.cardinalx.savedState",
  ]
end
