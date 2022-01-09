class UnifiDoorbellNotifier < Formula
  desc "Notify to your PC when Doorbell rung."
  homepage "https://github.com/sawadashota/unifi-doorbell-notifier"
  version "0.1.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/sawadashota/unifi-doorbell-notifier/releases/download/v0.1.2/unifi-doorbell-notifier_v0.1.2_x86_64-apple-darwin.zip"
    sha256 "f1c4f3df5c44b366723c69dbf1f342e72b132c72988a90d3b767f046e920ef93"
  end
  if OS.linux? && Hardware::CPU.intel?
    url "https://github.com/sawadashota/unifi-doorbell-notifier/releases/download/v0.1.2/unifi-doorbell-notifier_v0.1.2_x86_64-unknown-linux-musl.tar.gz"
    sha256 "2a2bc6077583d428fb844112a8cf6d59e63b8128e13d6f452bad0deff0bad36c"
  end
  if OS.linux? && Hardware::CPU.arm? && !Hardware::CPU.is_64_bit?
    url "https://github.com/sawadashota/unifi-doorbell-notifier/releases/download/v0.1.2/unifi-doorbell-notifier_v0.1.2_x86_64-unknown-linux-musl.tar.gz"
    sha256 "2a2bc6077583d428fb844112a8cf6d59e63b8128e13d6f452bad0deff0bad36c"
  end

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
