class Zapet < Formula
  desc "Zmux agent prompt editor TUI"
  homepage "https://github.com/maddada/zapet"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maddada/zapet/releases/download/zapet-v0.3.7/zapet-0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "2bc346c22f117d8eab7a7e8933d5d24189380595541acedc48e1b21e06a16487"
    else
      odie "zapet currently provides a prebuilt Homebrew formula only for Apple Silicon macOS"
    end
  end

  def install
    bin.install "zapet"
    bin.install "zapet-ssh-image"
  end

  def caveats
    <<~EOS
      Release notes: https://github.com/maddada/zapet/releases/tag/zapet-v#{version}
    EOS
  end

  test do
    assert_match "zapet", shell_output("#{bin}/zapet --version")
    assert_match "Usage: zapet-ssh-image", shell_output("#{bin}/zapet-ssh-image --help")
  end
end
