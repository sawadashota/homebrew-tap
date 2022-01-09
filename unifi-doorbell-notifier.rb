class UnifiDoorbellNotifier < Formula
  desc "Notify to your PC when Doorbell rung."
  homepage "https://github.com/sawadashota/unifi-doorbell-notifier"
  version "0.1.4"

  url "https://github.com/sawadashota/unifi-doorbell-notifier/releases/download/v0.1.4/unifi-doorbell-notifier_v0.1.4_x86_64-apple-darwin.zip"
  sha256 "1e0852e572377427d0beb9b21334fa5e1b3df01d88752e353fdaec451290d52c"

  def install
    bin.install "unifi-doorbell-notifier"
  end

  plist_options :startup => false

  def plist; <<~EOS
    <?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>KeepAlive</key>
    <dict>
      <key>SuccessfulExit</key>
      <false/>
    </dict>
    <key>Label</key>
    <string>#{plist_name}</string>
    <key>ProgramArguments</key>
    <array>
      <string>#{opt_bin}/unifi-doorbell-notifier</string>
      <string>serve</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>WorkingDirectory</key>
    <string>#{var}</string>
    <key>StandardErrorPath</key>
    <string>#{var}/log/unifi-doorbell-notifier.log</string>
    <key>StandardOutPath</key>
    <string>#{var}/log/unifi-doorbell-notifier.log</string>
  </dict>
</plist>

  EOS
  end

  test do
    system "#{bin}/unifi-doorbell-notifier --version"
  end
end
