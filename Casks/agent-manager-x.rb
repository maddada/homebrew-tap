cask "agent-manager-x" do
  version "1.1"

  on_arm do
    sha256 "3e68cfe79a652c9ea110966fe0566f7a2e249dda5d8394014e6c22412a515aa4"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "4c2fa7e2fc9d210f12413bc5f5fc12778f810c7e020ac11a31ee3de68c8ca05d"
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
