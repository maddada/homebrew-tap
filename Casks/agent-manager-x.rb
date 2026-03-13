cask "agent-manager-x" do
  version "1.5"

  on_arm do
    sha256 "6bb11e36f0b7bdb3809a5ec43b1084eaf1eba55ae26ebb4fa09e5f5f0da8a61d"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "241357982b1002484fc263df2c0171fb49270f41276005b18e65e15a4f53edd0"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_x64.dmg"
  end

  name "Agent Manager X"
  desc "Native SwiftUI macOS app to monitor AI coding agent sessions"
  homepage "https://github.com/maddada/agent-manager-x"

  depends_on macos: ">= :monterey"

  app "Agent Manager X.app"

  zap trash: [
    "~/Library/Preferences/com.madda.agentmanagerx.plist",
    "~/Library/Saved Application State/com.madda.agentmanagerx.savedState",
  ]
end
