cask "slapss" do
  version "2.3.0"
  sha256 "7d9a4f118918bb05340b6fa4ffdf75fb26e7b169e6eeab24ab1404f20590b4da"

  url "https://github.com/theshiver/slapss-app/releases/download/v#{version}/Slapss-#{version}.zip"
  name "Slapss"
  desc "Full-screen meeting alerts in the menu bar"
  homepage "https://slapss-app.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "slapss.app"

  uninstall quit: "com.cancetin.slapss"

  zap trash: "~/Library/Containers/com.cancetin.slapss"

  caveats <<~EOS
    If Slapss is already installed from the Mac App Store, remove that copy first.
  EOS
end
