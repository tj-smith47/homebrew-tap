class Cfgd < Formula
  desc "Declarative, GitOps-style machine configuration management"
  homepage "https://github.com/tj-smith47/cfgd"
  license "Apache-2.0"
  version "0.2.2"

  if OS.mac?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.2/cfgd-0.2.2-darwin-x86_64.tar.gz"
      sha256 "4701bbbde7095840d49ffb9d73ad4cccd0ee09e18c230f7ab10380b116163145"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.2/cfgd-0.2.2-darwin-aarch64.tar.gz"
      sha256 "454622afeb5f99ca13a940fae6ff0a1940e4e6ba97f6bb7d609d8e7ae18515ba"
    end
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.2/cfgd-0.2.2-linux-x86_64.tar.gz"
      sha256 "1d4eb270487282f2544d74b4eb3415667e9951bf45542d67608c41c20b8db716"
    elsif Hardware::CPU.arm?
      url "https://github.com/tj-smith47/cfgd/releases/download/v0.2.2/cfgd-0.2.2-linux-aarch64.tar.gz"
      sha256 "0037ac76ece6e8cccd77fccf8bfa74f7da7ea35594abb048e5f9225dbd20cabb"
    end
  end

  def install
    bin.install "cfgd"
  end

  test do
    system "#{bin}/cfgd", "--version"
  end
end
