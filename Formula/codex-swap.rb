class CodexSwap < Formula
  desc "Run Codex under different accounts with shared conversation history"
  homepage "https://github.com/maddada/codex-swap"
  version "0.3.3"
  license "MIT"

  # CDXC:Release 2026-09-06 DECISION:
  # Users install prebuilt binaries on macOS and Linux without Rust or Cargo.
  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "52f62a6fa1548427eadbca53622f878fc4b34165186d4754f8b50f7aa491dd84"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "bd8c57f72f93cab082ffded5ed52d6c8b985171762cb5d0a65a03f92446e0642"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3f4719adb9650bfb9d1f1a0be4a29d7997cea1a5cc0eba5d55c3673dc2af8f73"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ee3efc6b4d258325a1420a79df742f280aa56b0571858cc0d357a13ca1bc22b7"
    end
  end

  def install
    bin.install "xswap"
    doc.install "LICENSE", "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      Install the official Codex CLI separately and make sure codex is on PATH.
      Get started: codex login, then xswap add --alias personal
    EOS
  end
end
