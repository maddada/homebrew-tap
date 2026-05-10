class Zapet < Formula
  desc "Zmux agent prompt editor TUI"
  homepage "https://github.com/maddada/zapet"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maddada/zapet/releases/download/zapet-v0.3.6/zapet-0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "0cc90d848d8643dd6dbb48e8d37f34da38b66a8112855885b7c9cfd670d3ac9c"
    else
      odie "zapet currently provides a prebuilt Homebrew formula only for Apple Silicon macOS"
    end
  end

  def install
    bin.install "zapet"
    bin.install "zapet-ssh-image"
  end

  test do
    assert_match "zapet", shell_output("#{bin}/zapet --version")
    assert_match "Usage: zapet-ssh-image", shell_output("#{bin}/zapet-ssh-image --help")
  end
end
