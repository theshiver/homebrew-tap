cask "pano" do
  version "1.1.1"
  sha256 "b10e65373ae6beb2a547949accab89c2c37446eb2c8dbe581a42aaa43a8f782a"

  url "https://github.com/theshiver/pano-app/releases/download/v#{version}/Pano-#{version}.dmg"
  name "Pano"
  desc "Free, open-source, local-only clipboard manager for macOS"
  homepage "https://pano-app.com/"
  auto_updates true

  depends_on macos: ">= :sequoia"

  app "Pano.app"

  zap trash: [
    "~/Library/Application Support/Pano",
    "~/Library/Preferences/com.cancetin.pano.plist",
  ]
end
