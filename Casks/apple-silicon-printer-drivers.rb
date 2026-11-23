cask "apple-silicon-printer-drivers" do
  version "2.0.4"
  sha256 "5630172f18d8e725fdaaa72037daa900764e4616e9a9b84d99ff1c9e5f5f206f"

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
