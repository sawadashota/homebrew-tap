class UnifiDoorbellNotifier < Formula
  desc "Notify to your PC when Doorbell rung."
  homepage "https://github.com/sawadashota/unifi-doorbell-notifier"
  version "0.1.7"

  url "https://github.com/sawadashota/unifi-doorbell-notifier/releases/download/v0.1.7/unifi-doorbell-notifier_v0.1.7_x86_64-apple-darwin.zip"
  sha256 "9b84dae360488fcb6e8e8e0ad69fdd0fde0702776208c77adfd674edcec4fa76"

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
