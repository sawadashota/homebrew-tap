# This file was generated by GoReleaser. DO NOT EDIT.
class UnifiDoorbellChime < Formula
  desc "Notify to Mac when Doorbell rung."
  homepage "https://github.com/sawadashota/unifi-doorbell-chime"
  version "0.0.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/sawadashota/unifi-doorbell-chime/releases/download/0.0.1/unifi-doorbell-chime_0.0.1_Darwin_x86_64.tar.gz"
    sha256 "54c1f441f0ebba4d009e19fd8f93df037ef8a00fcb9fb8890c71fdee275cafda"
  elsif OS.linux?
  end

  def install
    bin.install "unifi-doorbell-chime"
    puts "please exec init command"
    puts
    puts "$ unifi-proto-chime init"
  end
end
