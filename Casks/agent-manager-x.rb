cask "agent-manager-x" do
  version "1.6"

  on_arm do
    sha256 "043d0e5721d06cee40ee36620629d4673acb8647f6840b0e0bf74a66971d0c1d"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "3e9519c5cb71bac664d32e0927e61c639123de9ab4e7badf0bd2df3d2bb634c7"
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
