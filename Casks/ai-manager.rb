cask "ai-manager" do
  version "0.1.19"

  on_arm do
    sha256 "465fe9ce976498d9e7997ba57dfec8564173adaf36a7b765fb0a57e56f621c77"
    url "https://github.com/maddada/agent-manager-x/releases/download/v#{version}/AgentManagerX_#{version}_aarch64.dmg"
  end

  on_intel do
    sha256 "cfcfa432916313cbc791b090f69c1aefe5e3b5ecb5bab31ed9f59523fcad2201"
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
