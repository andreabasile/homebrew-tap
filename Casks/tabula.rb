cask "tabula" do
  version "1.2.0"
  sha256 "9f460d3f8d65d72d6a561a411d877256250e6b6313474be171e8d265c91fa830"

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
