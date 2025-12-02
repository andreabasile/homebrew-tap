cask "portmonitor" do
    version "1.0.0"
    sha256 "00a0ac8c24206a0a4d6283b162b7d5df8bafd9a02b24d419e34b483608cc6d86"

    url "https://github.com/andreabasile/showPorts/releases/download/v#{version}/PortMonitor-#{version}.dmg"
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
