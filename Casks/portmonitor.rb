cask "portmonitor" do
  version "1.0.0"
  sha256 "REPLACE_WITH_ACTUAL_SHA256"

  url "https://github.com/YOUR_GITHUB_USERNAME/showPorts/releases/download/v#{version}/PortMonitor-#{version}.dmg"
  name "Port Monitor"
  desc "Modern network port monitoring application for macOS"
  homepage "https://github.com/YOUR_GITHUB_USERNAME/showPorts"

  depends_on macos: ">= :ventura"

  app "PortMonitor.app"

  zap trash: [
    "~/Library/Preferences/com.github.portmonitor.plist",
    "~/Library/Saved Application State/com.github.portmonitor.savedState",
  ]
end
