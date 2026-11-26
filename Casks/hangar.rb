cask "hangar" do
  version "0.1.0"
  sha256 "61097746048ba9b2368acab6bff48fe50f0138fcae575e78803624bf600c4ede"

  url "https://github.com/andreabasile/hangar/releases/download/v#{version}/Hangar-#{version}.dmg"
  name "Hangar"
  desc "Launcher for Claude Code, Codex and other coding-agent CLIs"
  homepage "https://andreabasile.github.io/hangar/"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Hangar.app"

  # Signed ad hoc and not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Hangar.app"]
  end

  uninstall quit: "it.basileandrea.hangar"

  zap trash: [
    "~/.config/hangar",
    "~/Library/Preferences/it.basileandrea.hangar.plist",
  ]
end
