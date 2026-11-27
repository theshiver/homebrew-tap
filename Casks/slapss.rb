cask "slapss" do
  version "2.4.0"
  sha256 "578653e09942280fef9dfa904fd04beaf2379c1fb2badb8057503da7de57420f"

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
