cask "pano" do
  version "1.1"
  sha256 "ce0695ecfe769b9fcef0fd45e94828ff3d64b630827a27bfa5f0dad27beb78c7"

  url "https://github.com/theshiver/pano-app/releases/download/v#{version}/Pano-#{version}.dmg"
  name "Pano"
  desc "Free, open-source, local-only clipboard manager for macOS"
  homepage "https://pano-app.com/"

  depends_on macos: ">= :sequoia"

  app "Pano.app"

  zap trash: [
    "~/Library/Application Support/Pano",
    "~/Library/Preferences/com.cancetin.pano.plist",
  ]
end
