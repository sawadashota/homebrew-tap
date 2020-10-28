# This file was generated by GoReleaser. DO NOT EDIT.
class UnifiDoorbellChime < Formula
  desc "Notify to Mac when Doorbell rung."
  homepage "https://github.com/sawadashota/unifi-doorbell-chime"
  version "0.0.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/sawadashota/unifi-doorbell-chime/releases/download/0.0.1/unifi-doorbell-chime_0.0.1_Darwin_x86_64.tar.gz"
    sha256 "b37e07791093682ab9ce2858dc4f7e5e0b3bde7db7f97dc4d540f33e7dd24961"
  elsif OS.linux?
  end

  def install
    bin.install "unifi-doorbell-chime"
    puts
    puts "please exec init command"
    puts
    puts
    puts "$ unifi-doorbell-chime init"
    puts
    puts
  end
end
