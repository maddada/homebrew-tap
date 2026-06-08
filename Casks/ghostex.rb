cask "ghostex" do
  arch arm: "arm64", intel: "x86_64"

  version "4.0.3"
  sha256 arm:   "844d8d4134a7e2f9919f6d29160264cff5977141fb49a5cdb36a245f462b624a",
         intel: "af041600d67011fd13ea4925d343ce2f5a1dfbebbd0fa6e9232cdc14c28e72ad"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-#{arch}.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  # CDXC:MacRelease 2026-05-29-20:59: Keep the explicit >= form so older
  # Homebrew clients treat macOS 13 Ventura as the minimum supported version,
  # not the only supported version, while newer Homebrew still parses the same
  # floor.
  depends_on macos: ">= :ventura"

  app "ghostex.app"
  binary "#{appdir}/ghostex.app/Contents/Resources/CLI/ghostex"
  binary "#{appdir}/ghostex.app/Contents/Resources/CLI/gx"

  # CDXC:CliBranding 2026-05-26-15:11: Install gx only when another tool does not already own that command name.
  # CDXC:CliInstall 2026-06-07-13:53: Homebrew links the app-owned CLI from
  # Contents/Resources/CLI, matching direct DMG auto-linking.
  preflight do
    gx_candidates = [HOMEBREW_PREFIX/"bin/gx"]
    ENV.fetch("PATH", "").split(File::PATH_SEPARATOR).each do |entry|
      gx_candidates << (Pathname(entry)/"gx") unless entry.empty?
    end

    gx_candidates.uniq.each do |gx_path|
      next if [gx_path.exist?, gx_path.symlink?].none?

      gx_target = gx_path.symlink? ? gx_path.readlink.to_s : gx_path.to_s
      next if gx_target.include?("ghostex.app/Contents/Resources/CLI/gx")

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
