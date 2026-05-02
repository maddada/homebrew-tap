cask "agent-manager-x" do
  version "2.6"

  on_arm do
    sha256 "b16e54facfd867d1f81cb7f6e95aa986ac649144b7343d170b31f0fdd3103d73"

    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end
  on_intel do
    sha256 "c2c1725b370e26eafa285442d5247dee1c05cf6a29363547b71d7cbcdf6c1b67"

    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_x64.dmg"
  end

  name "Agent Manager X"
  desc "Native SwiftUI app to monitor AI coding agent sessions"
  homepage "https://github.com/maddada/agent-manager-x"

  depends_on macos: ">= :monterey"

  app "Agent Manager X.app"

  zap trash: [
    "~/Library/Preferences/com.madda.agentmanagerx.plist",
    "~/Library/Saved Application State/com.madda.agentmanagerx.savedState",
  ]
end
