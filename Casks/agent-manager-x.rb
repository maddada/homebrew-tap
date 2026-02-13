cask "agent-manager-x" do
  version "1.2.1"

  on_arm do
    sha256 "7f0a28db9bd75811f144908fdd13e11024d1f71ffc97a68b31186c2021ff9772"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "1616600880ab5c5be77855f12a6d3ee4c0110e7dd128a57675265f3eb5446c24"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_x64.dmg"
  end

  name "Agent Manager X"
  desc "macOS desktop app to monitor running Claude Code sessions"
  homepage "https://github.com/maddada/agent-manager-x"

  depends_on macos: ">= :monterey"

  app "Agent Manager X.app"

  zap trash: [
    "~/Library/Preferences/com.agent-manager-x.plist",
    "~/Library/Saved Application State/com.agent-manager-x.savedState",
  ]
end
