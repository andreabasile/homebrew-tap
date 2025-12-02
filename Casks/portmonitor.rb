cask "portmonitor" do
    version "1.0.0"
    sha256 "0ee694bf0d39758f21823cb0960cc683894b942e34629525886419fa2cef9d53"

    url "https://github.com/andreabasile/showPorts/releases/download/v#{version}/PortMonitor-#{version}.dmg"
         https://github.com/andreabasile/showPorts/releases/download/v1.0.0/PortMonitor-1.0.0.dmg
    name "Port Monitor"
    desc "Modern network port monitoring application for macOS"
    homepage "https://github.com/andreabasile/showPorts"

    depends_on macos: ">= :ventura"

    app "PortMonitor.app"

    zap trash: [
      "~/Library/Preferences/com.github.portmonitor.plist",
      "~/Library/Saved Application State/com.github.portmonitor.savedState",
    ]
  end
