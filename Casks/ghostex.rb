cask "ghostex" do
  version "10.4.0"
  sha256 "72321ae61525bbb318af64dc80452f23dd13dd6ea8ebbf0562e46c640f682880"

  url "https://github.com/maddada/Ghostex/releases/download/v#{version}/ghostex-#{version}-arm64.dmg"
  name "Ghostex"
  desc "Workspace and session UI for agent terminals"
  homepage "https://github.com/maddada/Ghostex"

  conflicts_with cask: "zmux"
  # CDXC:Release 2026-06-21-13:20: GitHub issue #49 showed current
  # Homebrew treats the symbol form as the Ventura-or-newer floor, so keep this
  # syntax to avoid a warning on every brew invocation.
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "ghostex.app"
  # CDXC:Cli 2026-05-26-15:11: Install gx only when another tool does not already own that command name.
  # CDXC:Cli 2026-06-12-09:31: Homebrew writes wrapper files in
  # HOMEBREW_PREFIX/bin instead of binary symlinks into Ghostex.app because
  # macOS can kill direct app-bundled script execution during policy assessment.
  # CDXC:Release 2026-09-21 WHY: Homebrew 7.0.6 deprecated the Ruby
  # preflight/postflight blocks, so the wrappers are command_wrapper stanzas and
  # the checks are *_steps. Both need Homebrew 6.0.13 or newer.
  command_wrapper "ghostex", content: <<~EOS
    #!/bin/bash
    set -euo pipefail
    # CDXC:CliInstall 2026-06-12-09:31: Public PATH commands live outside Ghostex.app so macOS does not directly execute app-bundled shell scripts during policy assessment.
    exec "#{appdir}/ghostex.app/Contents/Resources/CLI/ghostex" "$@"
  EOS
  command_wrapper "gx", content: <<~EOS
    #!/bin/bash
    set -euo pipefail
    # CDXC:CliInstall 2026-06-12-09:31: Public PATH commands live outside Ghostex.app so macOS does not directly execute app-bundled shell scripts during policy assessment.
    exec "#{appdir}/ghostex.app/Contents/Resources/CLI/ghostex" "$@"
  EOS

  preflight_steps do
    write_file "ghostex-cli-conflict-check.sh", <<~SH, append_newline: true
      #!/bin/bash
      set -euo pipefail
      PREFIX="{{HOMEBREW_PREFIX}}"
      ghostex_owned() {
        local path="$1"
        local cmd="$2"
        local target=""
        local content=""
        if [[ -L "$path" ]]; then
          target=$(readlink "$path" || true)
        fi
        if [[ -f "$path" ]]; then
          content=$(cat "$path" 2>/dev/null || true)
        fi
        case "$content" in
          *"CDXC:CliInstall 2026-06-12-09:31"*)
            case "$content" in
              *"ghostex-cli.mjs"*|*"/Resources/CLI/ghostex"*) return 0 ;;
            esac
            ;;
        esac
        case "$target" in
          *"/Caskroom/ghostex/"*"/.homebrew-command-wrappers/$cmd") return 0 ;;
          *"ghostex.app/Contents/Resources/CLI/$cmd"*) return 0 ;;
          *"ghostex.app/Contents/Resources/Web/cli/$cmd"*) return 0 ;;
        esac
        if [[ "$cmd" == "ghostex" ]]; then
          case "$target" in
            *"ghostex.app/Contents/MacOS/ghostex"*) return 0 ;;
          esac
        fi
        return 1
      }
      for cmd in ghostex gx; do
        candidates=("$PREFIX/bin/$cmd")
        old_ifs="$IFS"
        IFS=":"
        for entry in $PATH; do
          [[ -n "$entry" ]] && candidates+=("$entry/$cmd")
        done
        IFS="$old_ifs"
        seen="|"
        for path in "${candidates[@]}"; do
          case "$seen" in
            *"|$path|"*) continue ;;
          esac
          seen="${seen}${path}|"
          if [[ ! -e "$path" && ! -L "$path" ]]; then
            continue
          fi
          if ghostex_owned "$path" "$cmd"; then
            continue
          fi
          echo "Ghostex cannot install the $cmd CLI because $path already exists. Remove or rename the existing $cmd command, then reinstall Ghostex." >&2
          exit 1
        done
      done
    SH
    set_permissions "ghostex-cli-conflict-check.sh", "0755"
    run "{{staged_path}}/ghostex-cli-conflict-check.sh"
  end

  postflight_steps do
    run "/usr/bin/xattr", args:         ["-d", "com.apple.provenance", "{{HOMEBREW_PREFIX}}/bin/ghostex"],
                          must_succeed: false,
                          print_stderr: false
    run "/usr/bin/xattr", args:         ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/ghostex"],
                          must_succeed: false,
                          print_stderr: false
    run "/usr/bin/xattr", args:         ["-d", "com.apple.provenance", "{{HOMEBREW_PREFIX}}/bin/gx"],
                          must_succeed: false,
                          print_stderr: false
    run "/usr/bin/xattr", args:         ["-d", "com.apple.quarantine", "{{HOMEBREW_PREFIX}}/bin/gx"],
                          must_succeed: false,
                          print_stderr: false
  end

  uninstall_preflight_steps do
    write_file "ghostex-cli-uninstall-wrappers.sh", <<~SH, append_newline: true
      #!/bin/bash
      set -euo pipefail
      PREFIX="{{HOMEBREW_PREFIX}}"
      for cmd in ghostex gx; do
        path="$PREFIX/bin/$cmd"
        if [[ -L "$path" || ! -f "$path" ]]; then
          continue
        fi
        content=$(cat "$path" 2>/dev/null || true)
        case "$content" in
          *"CDXC:CliInstall 2026-06-12-09:31"*)
            case "$content" in
              *"ghostex-cli.mjs"*|*"/Resources/CLI/ghostex"*) rm -f "$path" ;;
            esac
            ;;
        esac
      done
    SH
    set_permissions "ghostex-cli-uninstall-wrappers.sh", "0755"
    run "{{staged_path}}/ghostex-cli-uninstall-wrappers.sh", writable_paths: ["{{HOMEBREW_PREFIX}}/bin"]
  end

  zap trash: [
    "~/Library/Application Support/com.madda.zmux.host",
    "~/Library/Preferences/com.madda.zmux.host.plist",
    "~/Library/Saved Application State/com.madda.zmux.host.savedState",
  ]
end
