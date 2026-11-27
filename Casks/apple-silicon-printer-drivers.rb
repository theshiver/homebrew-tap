cask "apple-silicon-printer-drivers" do
  version "2.0.7"
  sha256 "115f561b9b8d52d4e360fb25bb05f8ab87d5b0a326300315a80ff66083a7030d"

  url "https://github.com/theshiver/apple-silicon-printer-drivers/releases/download/v#{version}/AppleSilicon-Printer-Drivers-#{version}.pkg"
  name "Apple Silicon Printer Drivers"
  desc "Native arm64 drivers for 3,700+ printers, plus AirPrint for iPhone and iPad"
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
