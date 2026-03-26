class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.5"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.5/cfgd-0.2.5-darwin-x86_64.tar.gz"
      sha256 "865db7bc27fe85c911f4a5a5b31b5d04dc5f45a78e36f7b4e8f0e5a368988fab"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.5/cfgd-0.2.5-darwin-aarch64.tar.gz"
      sha256 "14bad9524830bfa928bcf955c93515b8d3ff8ab05614d0327242ffc65b06a825"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.5/cfgd-0.2.5-linux-x86_64.tar.gz"
      sha256 "98144ca5b8a974a420a4943d67307c730655782416ebdc09c87b275367a239a2"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.5/cfgd-0.2.5-linux-aarch64.tar.gz"
      sha256 "29e6649de1daa94bc6e29f567e6c9b5bb97947da8acbefdeb7560e7c66321189"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
