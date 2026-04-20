cask "agent-manager-x" do
  version "2.4"

  on_arm do
    sha256 "f7a5e33d9d79e0c2c622b9fc7d1677cbc2e0a6405b9b48c577969b863942c559"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "264056d64335f6ecf6c58e11c27bf34f2a8257119bbc9c7a392091f85e8d3654"
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
