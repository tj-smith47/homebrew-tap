class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.3.0"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-darwin-x86_64.tar.gz"
      sha256 "121e8a4be84cd6ca9f8ec75f100ea02cc2192368a2887e1d1887d1b55b197798"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-darwin-aarch64.tar.gz"
      sha256 "60e3aed31cf105f1984eb0c4cbbd290b3375bd891367adb0377f24dff09e8123"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-linux-x86_64.tar.gz"
      sha256 "44d2cf1b759862eecaa66317f58136b2ffa3250bdf7c927a6c4cf276a276fa72"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.3.0/cfgd-0.3.0-linux-aarch64.tar.gz"
      sha256 "be276346de84e115c48f9cefe0c259fc9532ae5de6607b6f4779960675879317"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
