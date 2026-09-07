cask "clipbook-rs" do
  version "0.1.3"
  sha256 "5857241066c00b64ca48163b7098133a2ad63d06e522e57590d3bebe715acbf5"

  # Resolve credentials at install time; source and release downloads stay private.
  url "https://api.github.com/repos/maddada/clipbook-rs/releases/assets/548707762",
      header: ["Accept: application/octet-stream", "Authorization: Bearer #{GitHub::API.credentials}"]
  name "ClipBook Rust"
  desc "Clipboard history manager built with Rust and GPUI Kit"
  homepage "https://github.com/maddada/clipbook-rs"

  livecheck do
    skip "Private GitHub release"
  end

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ClipBook Rust.app"

  caveats <<~EOS
    This app and its release downloads are private.
    Sign in with `gh auth login` using a GitHub account with access to maddada/clipbook-rs.
    Alternatively, set HOMEBREW_GITHUB_API_TOKEN to a token with repository access.
  EOS
end
