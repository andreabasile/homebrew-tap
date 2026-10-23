cask "tabula" do
  version "1.0.0"
  sha256 "901ec39860979b28ceb0418d9e44f0b89d536ca5d9ef502243ca8212503022bd"

  url "https://github.com/andreabasile/tabula/releases/download/v#{version}/Tabula-#{version}.zip"
  name "Tabula"
  desc "Database client modelled on TablePlus, with automatic Aurora DSQL IAM tokens"
  homepage "https://github.com/andreabasile/tabula"

  depends_on arch: :arm64
  depends_on macos: ">= :sequoia"

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
