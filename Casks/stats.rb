cask "stats" do
  version "2.11.66"
  sha256 "9d820055c8f692bc01160d2a80b95c87968c535b2503b3a5d43d7a96df68fb5e"

  url "https://github.com/maddada/stats/releases/download/v#{version}/Stats.zip"
  name "Stats"
  desc "macOS system monitor in your menu bar"
  homepage "https://github.com/maddada/stats"

  app "Stats.app"
end
