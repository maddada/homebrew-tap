cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "3.20.0"
  sha256 arm:   "193f3fcfe454b8909baf892341c0e0d36966589da79be6884d7dbaf13f4ee8a9",
         intel: "d765c6f43f8f6764b0e9556427559e987cab60fbc3eed6aaf13e999cd609de49"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-#{arch}.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  depends_on macos: :ventura

  app "ghostex.app"
  binary "#{appdir}/ghostex.app/Contents/Resources/Web/cli/ghostex"
  binary "#{appdir}/ghostex.app/Contents/Resources/Web/cli/gx"

  # CDXC:CliBranding 2026-05-26-15:11: Install gx only when another tool does not already own that command name.
  preflight do
    gx_candidates = [HOMEBREW_PREFIX/"bin/gx"]
    ENV.fetch("PATH", "").split(File::PATH_SEPARATOR).each do |entry|
      gx_candidates << (Pathname(entry)/"gx") unless entry.empty?
    end

    gx_candidates.uniq.each do |gx_path|
      next if [gx_path.exist?, gx_path.symlink?].none?

      gx_target = gx_path.symlink? ? gx_path.readlink.to_s : gx_path.to_s
      next if gx_target.include?("ghostex.app/Contents/Resources/Web/cli/gx")

      raise "Ghostex cannot install the gx CLI because #{gx_path} already exists. " \
            "Remove or rename the existing gx command, then reinstall Ghostex."
    end
  end

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
