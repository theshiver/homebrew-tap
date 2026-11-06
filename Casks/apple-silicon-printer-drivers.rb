cask "apple-silicon-printer-drivers" do
  version "2.0.0"
  sha256 "339a8213e8fcee5fd8b8dcb9a25d21da1eadfb1ed2de3b6616e45ec5679fbdfe"

  url "https://github.com/theshiver/apple-silicon-printer-drivers/releases/download/v#{version}/AppleSilicon-Printer-Drivers-#{version}.pkg"
  name "Apple Silicon Printer Drivers"
  desc "Native arm64 drivers for 3,600+ printers, plus AirPrint for iPhone and iPad"
  homepage "https://macprinterdrivers.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  pkg "AppleSilicon-Printer-Drivers-#{version}.pkg"

  uninstall script:  {
              executable: "/Library/Printers/Gutenprint/bin/airprint-share",
              args:       ["set"],
              sudo:       false,
            },
            pkgutil: "com.github.apple-silicon-printer-drivers",
            delete:  [
              "/Library/Printers/Gutenprint",
              "/usr/local/bin/gutenprint-add",
            ]

  caveats <<~EOS
    USB printers are set up automatically. If yours was not, or it is on Wi-Fi:
      gutenprint-add --list "<model>"
      sudo gutenprint-add <model-id>
    Model search: https://macprinterdrivers.com/#search
  EOS
end
