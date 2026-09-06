class CodexSwap < Formula
  desc "Run Codex under different accounts with shared conversation history"
  homepage "https://github.com/maddada/codex-swap"
  version "0.1.0"
  license "MIT"

  # CDXC:Release 2026-09-06 DECISION:
  # Users install prebuilt binaries on macOS and Linux without Rust or Cargo.
  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ed0f1c51d0529f758e1d3c0ff15dba4c836f8b540c21aaaac7f0457b251614dc"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "f9c77adc9804b5efa0c6491c49671d9f2c1bcad7d7c3339327df00c141ce0d9d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "8ea4a0ea54b69f4f3c10e37c3162d330beb50c29bf320d522c44cfc846d4e70c"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dccaea13c81afefbc85a5bb150a7ac1e9283dc697c21f9e285a28a1ef3970394"
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
