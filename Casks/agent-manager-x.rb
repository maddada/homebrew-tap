cask "agent-manager-x" do
  version "2.3"

  on_arm do
    sha256 "3e61c32f4854f894084451ea67a64eb6c8dc2205dfc59553193b03477a02d142"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "330a880297b9ae9146eb298908d85f987d43a7f1b844a5529a1739f455a69f26"
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
