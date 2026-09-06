class CodexSwap < Formula
  desc "Run Codex under different accounts with shared conversation history"
  homepage "https://github.com/maddada/codex-swap"
  version "0.2.0"
  license "MIT"

  # CDXC:Release 2026-09-06 DECISION:
  # Users install prebuilt binaries on macOS and Linux without Rust or Cargo.
  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "47b53139bff1a2ae5d37f717994e886371a68d8b0fa0560df9c6f11a4dd7bc6b"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "aa146bf3e22a1283629e17ffd99da99f3ce0708e4eb408c324175de120627de6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "f56331b814d2ee5b79d5e4b3949fe406c599eb195ee91504d2500bd2a91dcfc1"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bd6aa85a00d1012f1731e92de937bfa5321fe423fbb1f45f96a1c526b4ea1df2"
    end
  end

  def install
    bin.install "xswap"
    doc.install "THIRD_PARTY_NOTICES.md"
  end

  def caveats
    <<~EOS
      Install the official Codex CLI separately and make sure codex is on PATH.
      Get started: xswap add --login --share-history
    EOS
  end
end
