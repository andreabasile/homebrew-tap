cask "tabula" do
  version "1.1.0"
  sha256 "5d2778301221a0bf132d8e59d2b722e58b1bc7d9c040a2f8aa2237b8b6c2538e"

  url "https://github.com/andreabasile/tabula/releases/download/v#{version}/Tabula-#{version}.dmg"
  name "Tabula"
  desc "Database client modelled on TablePlus, with automatic Aurora DSQL IAM tokens"
  homepage "https://github.com/andreabasile/tabula"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tabula.app"

  # Signed but not notarized: without this Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/Tabula.app"]
  end

  uninstall quit: "it.basileandrea.tabula"

  zap trash: [
    "~/Library/Application Support/Tabula",
    "~/Library/Preferences/it.basileandrea.tabula.plist",
  ]
end
