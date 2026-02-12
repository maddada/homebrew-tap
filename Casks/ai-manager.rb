cask "ai-manager" do
  version "1.0.0"

  on_arm do
    sha256 "0f158f7516073026cf7a4fb58a2aa5bec50124f42082f6be6e0e52cb3a433d7e"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "a71b57bd91b18c6cf10233ad701371dd06bb312c53514c866a63ea6b7185c7bd"
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
