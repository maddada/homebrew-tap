cask "agent-manager-x-swift" do
  version "1.0"

  on_arm do
    sha256 "205b69cda0608051578df28ab7d4ecc8c591f79a54c0f866a8d51f3af33a1e8d"
    url "https://github.com/maddada/agent-manager-x-swift/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "b2ddbf4ef3f5d6192ff6cad78f1efec1e2b5edc45b05075611a039922fbaa050"
    url "https://github.com/maddada/agent-manager-x-swift/releases/download/v#{version}/AgentManagerX_#{version}_x64.dmg"
  end

  name "Agent Manager X"
  desc "Native SwiftUI macOS app to monitor AI coding agent sessions"
  homepage "https://github.com/maddada/agent-manager-x-swift"

  depends_on macos: ">= :monterey"

  app "Agent Manager X.app"

  zap trash: [
    "~/Library/Preferences/com.madda.agentmanagerx.plist",
    "~/Library/Saved Application State/com.madda.agentmanagerx.savedState",
  ]
end
