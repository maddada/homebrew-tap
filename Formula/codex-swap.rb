class CodexSwap < Formula
  desc "Run Codex under different accounts with shared conversation history"
  homepage "https://github.com/maddada/codex-swap"
  version "0.3.6"
  license "MIT"

  # CDXC:Release 2026-09-06 DECISION:
  # Users install prebuilt binaries on macOS and Linux without Rust or Cargo.
  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "7540353daa9563b691554215b65242d47423d160724e672d3aa93e27d79aa7a7"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3cf6433daadc769e8145ecf1234456676d0100858f999bfd462af77a8ecbd98a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "cc45f565acfe8da73169c010250b43d1a2cbedc8c8f20ce5f679e8b28cdee4c3"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ea5a37d153b8f0b0fae44e7c3a6c6276a011e741dddd92dc66afa59e0b68782a"
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
