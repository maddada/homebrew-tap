class CodexSwap < Formula
  desc "Run Codex under different accounts with shared conversation history"
  homepage "https://github.com/maddada/codex-swap"
  version "0.3.4"
  license "MIT"

  # CDXC:Release 2026-09-06 DECISION:
  # Users install prebuilt binaries on macOS and Linux without Rust or Cargo.
  on_macos do
    depends_on macos: :big_sur

    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d0e54ff9d68ad04d15058aef508f3bedf49d50d1e2968aaddb1e8434ab777413"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "25616e5ff00081e7ddf8b91a58346a482712c09a08c5d0f1e83837da8ebc7ffa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ae4d0e3c0eca35b1f402a041915766ec4ae90a6b879aafe407785ed761e9f4c8"
    end

    on_intel do
      url "https://github.com/maddada/codex-swap/releases/download/v#{version}/codex-swap-#{version}-x86_64-unknown-linux-musl.tar.gz"
      sha256 "eb3620da5f03b57b9a3c770424b26c92ddb25f2d4bf4948be963683c1b646377"
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
