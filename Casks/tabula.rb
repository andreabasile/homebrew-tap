cask "tabula" do
  version "1.0.1"
  sha256 "80d8971c9c1a42733676b944346a6c7ac6a7c1464cdb76d084837dd8be7ddb83"

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
