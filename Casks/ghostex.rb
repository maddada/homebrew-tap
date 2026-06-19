cask "ghostex" do
  version "4.20.0"
  sha256 "23d855fb8730de9d7fd976ebe1dc660749797a32e20477cbe679d42791f87546"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-arm64.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  # CDXC:MacRelease 2026-05-29-20:59: Keep Ventura as the minimum
  # supported version using Homebrew symbol syntax to avoid deprecated
  # string-comparison warnings.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ghostex.app"

  # CDXC:CliBranding 2026-05-26-15:11: Install gx only when another tool does not already own that command name.
  # CDXC:CliInstall 2026-06-12-09:31: Homebrew writes wrapper files in
  # HOMEBREW_PREFIX/bin instead of binary symlinks into Ghostex.app because
  # macOS can kill direct app-bundled script execution during policy assessment.
  # CDXC:HomebrewRelease 2026-06-16-20:54: Keep preflight errors wrapped so
  # automated tap pushes pass brew style after publication.
  preflight do
    commands = ["ghostex", "gx"]
    commands.each do |command|
      command_candidates = [HOMEBREW_PREFIX/"bin/#{command}"]
      ENV.fetch("PATH", "").split(File::PATH_SEPARATOR).each do |entry|
        command_candidates << (Pathname(entry)/command) unless entry.empty?
      end

      command_candidates.uniq.each do |command_path|
        next if [command_path.exist?, command_path.symlink?].none?

        command_target = command_path.symlink? ? command_path.readlink.to_s : command_path.to_s
        command_content = command_path.file? ? command_path.read : ""
        if command_content.include?("CDXC:CliInstall 2026-06-12-09:31") && command_content.include?("ghostex-cli.mjs")
          next
        end
        next if command_target.include?("ghostex.app/Contents/Resources/CLI/#{command}")
        next if command_target.include?("ghostex.app/Contents/Resources/Web/cli/#{command}")
        next if command == "ghostex" && command_target.include?("ghostex.app/Contents/MacOS/ghostex")

        raise [
          "Ghostex cannot install the #{command} CLI because #{command_path} already exists.",
          "Remove or rename the existing #{command} command, then reinstall Ghostex.",
        ].join(" ")
      end
    end
  end

  postflight do
    cli_script = "#{appdir}/ghostex.app/Contents/Resources/CLI/ghostex-cli.mjs"
    bin_dir = HOMEBREW_PREFIX/"bin"
    policy_attributes = ["com.apple.provenance", "com.apple.quarantine"]
    bin_dir.mkpath

    ["ghostex", "gx"].each do |command|
      command_path = bin_dir/command
      if command_path.symlink?
        command_path.delete
      elsif command_path.exist?
        command_content = command_path.file? ? command_path.read : ""
        if command_content.include?("CDXC:CliInstall 2026-06-12-09:31") && command_content.include?("ghostex-cli.mjs")
          command_path.delete
        end
      end

      command_path.write <<~EOS
        #!/bin/bash
        set -euo pipefail
        # CDXC:CliInstall 2026-06-12-09:31: Public PATH commands live outside Ghostex.app so macOS does not directly execute app-bundled shell scripts during policy assessment.
        exec /usr/bin/env node "#{cli_script}" "$@"
      EOS
      command_path.chmod 0755
      policy_attributes.each do |attribute|
        system "/usr/bin/xattr", "-d", attribute, command_path.to_s, out: File::NULL, err: File::NULL
      end
    end
  end

  uninstall_preflight do
    ["ghostex", "gx"].each do |command|
      command_path = HOMEBREW_PREFIX/"bin/#{command}"
      next if !command_path.exist? || !command_path.file?

      command_content = command_path.read
      if command_content.include?("CDXC:CliInstall 2026-06-12-09:31") && command_content.include?("ghostex-cli.mjs")
        command_path.delete
      end
    end
  end

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
