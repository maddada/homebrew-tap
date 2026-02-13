cask "agent-manager-x" do
  version "1.1.0"

  on_arm do
    sha256 "b09b13ab9bf316b5cef5c56978b7e5475c5aa1062c69822dd18d7149b299c76d"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "c87cec1f63acdfc4dd3bbf175807c902afe4d48815afc1c842c27affacd7bbf6"
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
