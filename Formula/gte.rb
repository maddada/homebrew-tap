class Gte < Formula
  desc "Ghostex Terminal Editor prompt TUI"
  homepage "https://github.com/maddada/gte"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/maddada/zpet/releases/download/gte-v0.3.8/gte-0.3.8-aarch64-apple-darwin.tar.gz"
      sha256 "6bd8adb029e0d2e6b589b15d857deae5c7631bbf48ad5bf017072560c592306d"
    else
      odie "gte currently provides a prebuilt Homebrew formula only for Apple Silicon macOS"
    end
  end

  def install
    # CDXC:GteHomebrew 2026-05-23-01:14:
    # Ghostex installs gte through maddada/tap/gte when users select the Ctrl+G terminal editor.
    # The 0.3.8 artifact is the first release that ships real `gte` and `gte-ssh-image`
    # executables, so install them directly instead of aliasing old zapet binary names.
    bin.install "gte"
    bin.install "gte-ssh-image"
  end

  def caveats
    <<~EOS
      Release notes: https://github.com/maddada/zpet/releases/tag/gte-v#{version}
    EOS
  end

  test do
    assert_match "gte", shell_output("#{bin}/gte --version")
    assert_match "Usage: gte-ssh-image", shell_output("#{bin}/gte-ssh-image --help")
  end
end
