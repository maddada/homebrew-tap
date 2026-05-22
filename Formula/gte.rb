class Gte < Formula
  desc "Ghostex Terminal Editor prompt TUI"
  homepage "https://github.com/maddada/gte"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maddada/zpet/releases/download/zapet-v0.3.7/zapet-0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "2bc346c22f117d8eab7a7e8933d5d24189380595541acedc48e1b21e06a16487"
    else
      odie "gte currently provides a prebuilt Homebrew formula only for Apple Silicon macOS"
    end
  end

  def install
    # CDXC:GteHomebrew 2026-05-22-10:27:
    # Ghostex installs gte through maddada/tap/gte when users select the Ctrl+G terminal editor.
    # The first gte formula reuses the last compatible pre-rename artifact and
    # exposes renamed commands so Ghostex can launch `gte` inline until the
    # standalone gte release pipeline publishes native gte artifacts.
    bin.install "zapet" => "gte"
    bin.install "zapet-ssh-image" => "gte-ssh-image"
  end

  def caveats
    <<~EOS
      Release notes: https://github.com/maddada/zpet/releases/tag/zapet-v#{version}
    EOS
  end

  test do
    assert_match "zapet", shell_output("#{bin}/gte --version")
    assert_match "Usage: zapet-ssh-image", shell_output("#{bin}/gte-ssh-image --help")
  end
end
