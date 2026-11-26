cask "tabula" do
  version "1.2.1"
  sha256 "5083a2fb38aa1e3a0c4fe73e06cc58017f65bc5ff4fe1464c7d5afa9a17830a8"

  url "https://github.com/andreabasile/tabula/releases/download/v#{version}/Tabula-#{version}.dmg"
  name "Tabula"
  desc "Database client modelled on TablePlus, with automatic Aurora DSQL IAM tokens"
  homepage "https://github.com/andreabasile/tabula"

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Tabula.app"

  # Signed but not notarized: without this Gatekeeper refuses to open it.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Tabula.app"]
  end

  uninstall quit: "it.basileandrea.tabula"

  zap trash: [
    "~/Library/Application Support/Tabula",
    "~/Library/Preferences/it.basileandrea.tabula.plist",
  ]
end
