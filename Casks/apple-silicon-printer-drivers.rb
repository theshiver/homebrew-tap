cask "apple-silicon-printer-drivers" do
  version "1.3.11"
  sha256 "3ee0a22e9c12a75d6b5429bc33bae05952763d29b233e4aea6c93fface27e825"

  url "https://github.com/theshiver/apple-silicon-printer-drivers/releases/download/v#{version}/AppleSilicon-Printer-Drivers-#{version}.pkg"
  name "Apple Silicon Printer Drivers"
  desc "Native arm64 drivers for 3,800+ Canon, Epson, HP, Brother and Samsung printers"
  homepage "https://theshiver.github.io/apple-silicon-printer-drivers/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  pkg "AppleSilicon-Printer-Drivers-#{version}.pkg"

  uninstall pkgutil: "com.github.apple-silicon-printer-drivers",
            delete:  [
              "/Library/Printers/Gutenprint",
              "/usr/local/bin/gutenprint-add",
            ]

  caveats <<~EOS
    USB printers are set up automatically. If yours was not, or it is on Wi-Fi:
      gutenprint-add --list "<model>"
      sudo gutenprint-add <model-id>
    Model search: https://theshiver.github.io/apple-silicon-printer-drivers/#search
  EOS
end
