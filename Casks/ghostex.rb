cask "ghostex" do
  version "9.4.0"
  sha256 "ff3c7f47cfca5848401a48f1d6f4a8ab21359599df746edaa92c81615c06c0c9"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-arm64.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  # CDXC:MacRelease 2026-06-21-13:20: GitHub issue #49 showed current
  # Homebrew treats the symbol form as the Ventura-or-newer floor, so keep this
  # syntax to avoid a warning on every brew invocation.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ghostex.app"

  # CDXC:CliBranding 2026-05-26-15:11: Install gx only when another tool does not already own that command name.
  # CDXC:CliInstall 2026-06-12-09:31: Homebrew writes wrapper files in
  # HOMEBREW_PREFIX/bin instead of binary symlinks into Ghostex.app because
  # macOS can kill direct app-bundled script execution during policy assessment.
  preflight_steps do
    run "/bin/bash", args: ["-c", <<~'BASH']
      set -euo pipefail
      for command in ghostex gx; do
        for directory in "{{HOMEBREW_PREFIX}}/bin" ${PATH//:/ }; do
          command_path="${directory}/${command}"
          if [[ ! -e "${command_path}" && ! -L "${command_path}" ]]; then
            continue
          fi

          command_target="$(readlink "${command_path}" 2>/dev/null || printf '%s' "${command_path}")"
          if [[ -f "${command_path}" ]] &&
             grep -qF "CDXC:CliInstall 2026-06-12-09:31" "${command_path}" &&
             grep -Eq "ghostex-cli\\.mjs|/Resources/CLI/ghostex" "${command_path}"; then
            continue
          fi
          if [[ "${command_target}" == *"ghostex.app/Contents/Resources/CLI/${command}"* ||
                "${command_target}" == *"ghostex.app/Contents/Resources/Web/cli/${command}"* ||
                ( "${command}" == "ghostex" && "${command_target}" == *"ghostex.app/Contents/MacOS/ghostex"* ) ]]; then
            continue
          fi

          printf 'Ghostex cannot install the %s CLI because %s already exists. Remove or rename the existing command, then reinstall Ghostex.\n' \
            "${command}" "${command_path}" >&2
          exit 1
        done
      done
    BASH
  end

  postflight_steps do
    remove ["bin/ghostex", "bin/gx"],
           base:             :homebrew_prefix,
           content_contains: "CDXC:CliInstall 2026-06-12-09:31"
    remove ["bin/ghostex", "bin/gx"],
           base:                    :homebrew_prefix,
           symlink_target_contains: "ghostex.app/Contents/"
    write_file "bin/ghostex", <<~EOS, base: :homebrew_prefix, overwrite: false
      #!/bin/bash
      set -euo pipefail
      # CDXC:CliInstall 2026-06-12-09:31: Public PATH commands live outside Ghostex.app so macOS does not directly execute app-bundled shell scripts during policy assessment.
      exec "{{appdir}}/ghostex.app/Contents/Resources/CLI/ghostex" "$@"
    EOS
    write_file "bin/gx", <<~EOS, base: :homebrew_prefix, overwrite: false
      #!/bin/bash
      set -euo pipefail
      # CDXC:CliInstall 2026-06-12-09:31: Public PATH commands live outside Ghostex.app so macOS does not directly execute app-bundled shell scripts during policy assessment.
      exec "{{appdir}}/ghostex.app/Contents/Resources/CLI/ghostex" "$@"
    EOS
    set_permissions ["bin/ghostex", "bin/gx"], "0755", base: :homebrew_prefix, recursive: false
  end

  uninstall_preflight_steps do
    remove ["bin/ghostex", "bin/gx"],
           base:             :homebrew_prefix,
           content_contains: "CDXC:CliInstall 2026-06-12-09:31"
    remove ["bin/ghostex", "bin/gx"],
           base:                    :homebrew_prefix,
           symlink_target_contains: "ghostex.app/Contents/"
  end

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
