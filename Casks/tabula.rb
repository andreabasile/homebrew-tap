cask "tabula" do
  version "1.0.1"
  sha256 "6660c66150d8a5d7a915f2cc60de2efc1d53a1bea5dc3a7bb2539a1f0e8eeeb7"

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
