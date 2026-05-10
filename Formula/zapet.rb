class Zapet < Formula
  desc "Zmux agent prompt editor TUI"
  homepage "https://github.com/maddada/zapet"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maddada/zapet/releases/download/zapet-v0.3.5/zapet-0.3.5-aarch64-apple-darwin.tar.gz"
      sha256 "68fed5765a95180d5325a057d5c77b600265b6d4a9490783205237e132ba131a"
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
